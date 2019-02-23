#
# Cookbook:: fort-pinecone
# Recipe:: sevices-realsil
#
# Copyright:: 2019, The Authors, All Rights Reserved.

name   =   'realsil'
domain =   'realsil.net'

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

git "/var/www/#{name}" do
  repository 'https://github.com/zinefer/realsil.net.git'
end

acme_certificate domain do
  crt       "/etc/ssl/#{domain}.crt"
  key       "/etc/ssl/#{domain}.key"
  wwwroot   "/var/www/#{name}"
  notifies  :reload, 'service[nginx]'
end