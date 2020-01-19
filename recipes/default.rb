#
# Cookbook:: mongo4_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

bash 'mongo to source list using key' do
  code <<-EOH
    wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    EOH
  end

apt_update

bash 'install mongo' do
  code <<-EOH
    sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
    EOH
  end

# package 'mongodb-org=4.2.1' do
#   action :install
# end

service 'mongod' do
  action [:start, :enable]
end
