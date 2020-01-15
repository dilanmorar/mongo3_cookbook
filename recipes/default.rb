#
# Cookbook:: mongo4_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

bash 'mongo_get_source' do
  code <<-EOH
    # getting key for repo
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    # gets url of that source and adds to list
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    # pulls from source
    # sudo apt-get update -y
    EOH
  end

apt_update

bash 'install_mongo' do
  code <<-EOH
    # installs
    sudo apt install mongodb-org=4.2.1 mongodb-org-server=4.2.1 mongodb-org-shell=4.2.1 mongodb-org-mongos=4.2.1 mongodb-org-tools=4.2.1
    EOH
  end

# package 'mongodb-org=3.2.20' do
#   action :install
# end

service 'mongod' do
  action [:start, :enable]
end
