


include_recipe "morgue::apache2"

template "#{node['morgue']['git_checkout_directory']}/config/production.json" do
  source "config.json.erb"
  owner node['apache']['user']
  group node['apache']['group']
  variables({
    :mysqlhost => node['morgue']['database_host'],
    :mysqlport => node['morgue']['database_port'],
    :database => node['morgue']['database'],
    :dbuser => node['morgue']['dbuser'],
    :dbpasswd => node['morgue']['dbpasswd'],
  })
end

