
package "git" do
  action :install
end

# Make sure parent directory exists
directory File.dirname(node['morgue']['git_checkout_directory']) do
  recursive true
  owner node['apache']['user']
  group node['apache']['group']
end

# Checkout morgue from git
git "#{node['morgue']['git_checkout_directory']}" do
  repository "#{node['morgue']['git_repo']}"
  reference "#{node['morgue']['git_ref']}"
  action :sync
end
