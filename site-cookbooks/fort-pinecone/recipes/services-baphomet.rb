#
# Cookbook:: fort-pinecone
# Recipe:: sevices-baphomet
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user = 'baphomet-bot'
home = '/home/baphomet-bot'
bots = '/var/bots/baphomet'

# ---- Install Python3.7

package 'software-properties-common'

apt_repository 'deadsnakes' do
  uri 'ppa:deadsnakes/ppa'
  components ['main']
  distribution node['lsb']['codename']
end

package 'python3.7'
package 'python3.7-dev'
package 'build-essential'
package 'libssl-dev'
package 'libffi-dev'
package 'default-jre'

remote_file '/root/get-pip.py' do
  source 'https://bootstrap.pypa.io/get-pip.py'
end

execute "python3.7 /root/get-pip.py 'pip==19.2.2'" do
  creates '/usr/local/bin/pip3'
end

# ---- Setup discord and bot settings

user_account user

directory bots do
  recursive true
  user  user
  group user
end

execute 'chown-baphomet-home' do
  command "chown -R baphomet-bot:baphomet-bot #{home}"
  action :nothing
end

execute 'python3.7 -m pip install --user -U Red-DiscordBot[voice]' do
  cwd bots
  environment HOME: home, USER: user
  user user
  notifies :run, execute: 'chown-baphomet-home'
end

directory "#{home}/.config/Red-DiscordBot" do
  recursive true
  user  user
  group user
end

cookbook_file "#{home}/.config/Red-DiscordBot/config.json" do
  source 'baphomet/config.json'
end

directory "#{bots}/core" do
  recursive true
  user  user
  group user
end

template "#{bots}/core/settings.json" do
  source 'baphomet-settings.json.erb'
  variables token: data_bag_item('baphomet', 'token')['content']
end

poise_service 'baphomet' do
  command "#{home}/.local/bin/redbot-launcher Baphomet --start --update --no-prompt"
  options :systemd, restart_mode: 'always'
  user user
end