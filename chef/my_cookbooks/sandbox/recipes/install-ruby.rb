include_recipe 'ruby-install'
include_recipe 'ruby-install::install'

directory node[:ruby_src_path] do
  action :delete
end

package 'sqlite-devel' do
end

package 'gcc-c++' do
end

%w[ bundle  bundler  erb  gem  irb  rake  rdoc  ri  ruby  testrb rails ].each do |exec|
  target_path = File.join(node[:ruby_install_path], 'bin', exec)
  link_path = File.join('/usr/bin', exec)

  link link_path do
    to target_path
  end
end
