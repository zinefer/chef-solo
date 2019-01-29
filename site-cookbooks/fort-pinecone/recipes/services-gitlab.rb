#
# Cookbook:: fort-pinecone
# Recipe:: sevices-gitlab
#
# Copyright:: 2019, The Authors, All Rights Reserved.

domain = 'git.pinecone.industries'

node.default['omnibus-gitlab']['gitlab_rb']['external_url'] = "https://#{domain}/"
node.default['omnibus-gitlab']['gitlab_rb']['nginx']['listen_addresses'] = ['localhost']
node.default['omnibus-gitlab']['gitlab_rb']['nginx']['listen_port'] = 8080
node.default['omnibus-gitlab']['gitlab_rb']['nginx']['listen_https'] = false


execute 'apt-get update' do
  action :nothing
end

include_recipe 'omnibus-gitlab::default'

acme_selfsigned domain do
  crt "/etc/ssl/#{domain}.crt"
  key "/etc/ssl/#{domain}.key"
end

nginx_site domain do
  template 'nginx-gitlab.conf.erb'
  variables name: 'gitlab', domain: domain
  notifies :reload, 'service[nginx]', :immediately
end

directory '/var/www/gitlab'

acme_certificate domain do
  crt       "/etc/ssl/#{domain}.crt"
  key       "/etc/ssl/#{domain}.key"
  wwwroot   '/var/www/gitlab'
  notifies  :reload, 'service[nginx]'
end