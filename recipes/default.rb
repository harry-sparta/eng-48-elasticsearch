#
# Cookbook:: elasticsearch_eng48
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# --Updates--------------------------------------------------
apt_update 'update ubuntu' do
  action :update
end

# --Java Install--------------------------------------------------
apt_package 'openjdk-8-jdk' do
  action :install
end

# --Elasticsearch install--------------------------------------------------
elasticsearch_user 'elasticsearch' do
  action :nothing
end

elasticsearch_install 'elasticsearch' do
  type :package
end

# --Template --------------------------------------------------
template '/etc/elasticsearch/elasticsearch.yml' do
  source 'elasticsearch.yml.erb'
end

# --Service --------------------------------------------------
service 'elasticsearch' do
  action [:enable, :start]
end

# --Plugin--------------------------------------------------
# execute 'big_desk_plugin' do
#   command 'sudo ./bin/plugin-install lukas-vlcek/bigdesk'
#   action :run
# end
