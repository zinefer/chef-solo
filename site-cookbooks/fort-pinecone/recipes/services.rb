#
# Cookbook:: fort-pinecone
# Recipe:: setup_apps
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Install nginx
include_recipe 'nginx'

directory '/var/www/default'
cookbook_file '/var/www/default/index.html' do
  source 'default-site-content.html'
end

acme_selfsigned 'default' do
  crt "/etc/ssl/default.crt"
  key "/etc/ssl/default.key"
end

nginx_site 'default' do
  template 'nginx-default-site.conf.erb'
  notifies :reload, 'service[nginx]', :immediately
end

# Let's Encrypt Automatic Certificate Management Environment
include_recipe 'acme'

include_recipe 'fort-pinecone::services-jameskiefer'
include_recipe 'fort-pinecone::services-baphomet'
include_recipe 'fort-pinecone::services-gitlab'
include_recipe 'fort-pinecone::services-rocketchat'