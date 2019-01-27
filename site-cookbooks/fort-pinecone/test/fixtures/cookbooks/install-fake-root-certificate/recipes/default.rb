#
# Cookbook:: install-fake-root-certificate
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

remote_file '/root/cacert.pem' do
  source 'https://localhost:14000/root'
end