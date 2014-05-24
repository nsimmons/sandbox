remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm" do
  source "http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm"
end

package "add mysql repo" do
  source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm"
end

package "mysql-community-server" do
end

bash "start mysqld" do
  user "root"
  code <<-EOH
  chkconfig mysqld on
  service mysqld start
  EOH
end
