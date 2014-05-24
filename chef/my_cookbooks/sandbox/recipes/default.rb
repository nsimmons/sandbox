file '/home/vagrant/install.sh' do
  action :delete
end

bash "open incoming port 3000" do
  user "root"
  code <<-EOH
  iptables -I INPUT -p tcp --dport 3000 -j ACCEPT
  service iptables save
  EOH
end
