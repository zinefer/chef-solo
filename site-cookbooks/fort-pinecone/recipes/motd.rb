#
# Cookbook:: fort-pinecone
# Recipe:: motd
#
# Copyright:: 2019, The Authors, All Rights Reserved.

remote_directory '/etc/update-motd.d/' do
  source 'motd'
  owner 'root'
  group 'root'
  mode '0755'
  files_mode '0755'
  action :create
end