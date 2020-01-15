#
# Cookbook:: mongo4_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

bash 'mongo to source list using key' do
  code <<-EOH
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    EOH
  end

apt_update

bash 'install mongo' do
  code <<-EOH
    sudo apt install mongodb-org=4.2.1 mongodb-org-server=4.2.1 mongodb-org-shell=4.2.1 mongodb-org-mongos=4.2.1 mongodb-org-tools=4.2.1
    EOH
  end

# package 'mongodb-org=3.2.20' do
#   action :install
# end

service 'mongod' do
  action [:start, :enable]
end
