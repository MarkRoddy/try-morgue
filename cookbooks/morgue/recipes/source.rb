

package "git" do
  action :install
end

git "#{node['morgue']['git_checkout_directory']}" do
  repository "#{node['morgue']['git_repo']}"
  reference "#{node['morgue']['git_ref']}"
  action :sync
end