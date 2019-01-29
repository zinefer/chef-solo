#
# Cookbook:: fort-pinecone
# Recipe:: sevices-rocketchat
#
# Copyright:: 2019, The Authors, All Rights Reserved.

domain = 'chat.jameskiefer.com'

user_account 'rocketchat'

node.default['mongodb']['package_version'] = '3.6.9'
node.default['mongodb']['config']['mongod']['net']['bindIp'] = '127.0.0.1'
node.default['mongodb']['config']['mongod']['replication']['oplogSizeMB'] = '1024'

include_recipe 'sc-mongodb::default'

node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '8.11.4'
node.default['nodejs']['binary']['checksum'] = '459144e361d64ca7362c37cc9717c044ef909d348cb5aa3f2b62538560a6085a'

include_recipe 'nodejs'

package 'graphicsmagick'

remote_file '/home/rocketchat/rocket.chat.tgz' do
  source 'https://releases.rocket.chat/latest/download'
end

directory '/home/rocketchat/rocket.chat'

execute 'tar -xzf rocket.chat.tgz -C rocket.chat' do
  cwd '/home/rocketchat'
end

bash 'install-rocketchat' do
  cwd '/home/rocketchat/rocket.chat/bundle/programs/server'
  code <<-EOF
    npm install
    mv ../../../bundle /opt/Rocket.Chat
    chown -R rocketchat:rocketchat /opt/Rocket.Chat
  EOF
  creates '/opt/Rocket.Chat'
end

acme_selfsigned 'chat.jameskiefer.com' do
  crt "/etc/ssl/#{domain}.crt"
  key "/etc/ssl/#{domain}.key"
end

nginx_site 'chat.jameskiefer' do
  template 'nginx-rocketchat.conf.erb'
  variables name: 'rocketchat', domain: domain
  notifies :reload, 'service[nginx]', :immediately
end

acme_certificate 'chat.jameskiefer.com' do
  crt       "/etc/ssl/#{domain}.crt"
  key       "/etc/ssl/#{domain}.key"
  wwwroot   '/var/www/rocketchat'
  notifies  :reload, 'service[nginx]'
end

template '/etc/systemd/system/rocketchat.service' do
  source 'rocketchat.service.erb'
  variables mongo: 'mongodb://localhost:27017/rocketchat', root: 'https://chat.jameskiefer.com:3000/', port: '3000'
  notifies :restart, 'service[rocketchat]'
end

systemd_unit 'rocketchat.service' do
  content lazy { ::File.read('/etc/systemd/system/rocketchat.service') }
  action :create
end

service 'rocketchat' do
  action [:enable, :start]
end