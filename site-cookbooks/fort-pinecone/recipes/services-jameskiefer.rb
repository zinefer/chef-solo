#
# Cookbook:: fort-pinecone
# Recipe:: sevices-jameskiefer
#
# Copyright:: 2019, The Authors, All Rights Reserved.

name   =   'jameskiefer'
domain =   'jameskiefer.com'

acme_selfsigned domain do
  crt       "/etc/ssl/#{domain}.crt"
  key       "/etc/ssl/#{domain}.key"
end

nginx_site domain do
  template  'nginx-static-site.conf.erb'
  variables name: name, domain: domain
  notifies  :reload, 'service[nginx]', :immediately
end

directory "/var/www/#{name}" do
  recursive true
end

file "/var/www/#{name}/index.html" do
  content   'Maintenance'
  action :create_if_missing
end

acme_certificate domain do
  crt       "/etc/ssl/#{domain}.crt"
  key       "/etc/ssl/#{domain}.key"
  wwwroot   "/var/www/#{name}"
  notifies  :reload, 'service[nginx]'
end