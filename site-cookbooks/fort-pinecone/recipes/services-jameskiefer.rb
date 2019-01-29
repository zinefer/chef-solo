#
# Cookbook:: fort-pinecone
# Recipe:: sevices-jameskiefer
#
# Copyright:: 2019, The Authors, All Rights Reserved.

acme_selfsigned 'jameskiefer.com' do
  crt     '/etc/ssl/jameskiefer.com.crt'
  key     '/etc/ssl/jameskiefer.com.key'
end

nginx_site 'jameskiefer' do
  template 'nginx-static-site.conf.erb'
  variables name: 'jameskiefer', domain: 'jameskiefer.com'
  notifies :reload, 'service[nginx]', :immediately
end

directory '/var/www/jameskiefer' do
  recursive true
end

file '/var/www/jameskiefer/index.html' do
  content 'Maintenance'
end

acme_certificate 'jameskiefer.com' do
  crt       '/etc/ssl/jameskiefer.com.crt'
  key       '/etc/ssl/jameskiefer.com.key'
  wwwroot   '/var/www/jameskiefer'
  notifies  :reload, 'service[nginx]'
end
