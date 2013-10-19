
include_recipe "apache2"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"


# Render apache vhost
template "/etc/apache2/sites-available/morgue.conf" do
  owner node['apache']['user']
  group node['apache']['group']
  notifies :restart, "service[apache2]", :delayed
end

link "/etc/apache2/sites-enabled/morgue.conf" do
  to "/etc/apache2/sites-available/morgue.conf"
  notifies :restart, "service[apache2]", :delayed
end