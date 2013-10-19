
if platform_family?('debian')
  include_recipe "apt"
end
include_recipe "mysql::server"


execute "Create morgue database" do
  command %Q{mysql --user=root --password=#{node['mysql']['server_root_password']} --execute="CREATE DATABASE IF NOT EXISTS #{node['morgue']['database']}"}
  creates "#{node['mysql']['data_dir']}/morgue"
end

# This is kind of shitty, we touch a file in the /schema/ directory to
# note that it has been installed. Otherwise we don't have a good way of
# knowing if this process is completed or not.  The really shitty thing is
# that if you blow away the /var/www/morgue directory for whatever reason
# you're going to end up with missing tables.
include_recipe "morgue::source"
bash "Create Database Tables" do
  code <<-EOF
  for dbscript in $(ls #{node['morgue']['git_checkout_directory']}/schemas/*.sql); do
    mysql --user=root --password=#{node['mysql']['server_root_password']} #{node['morgue']['database']} < $dbscript;
  done
  touch #{node['morgue']['git_checkout_directory']}/schemas/installed
  EOF
  not_if "test -f #{node['morgue']['git_checkout_directory']}/schemas/installed"
end