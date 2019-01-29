# # encoding: utf-8

# Inspec test for recipe jameskiefer::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

home = '/home/baphomet-bot'
bots = '/var/bots/baphomet'

describe json("#{bots}/core/settings.json") do
  its(['0','GLOBAL', 'token']) { should eq 'ThisIsNotACTUALLY.atoken' }
end

describe json("#{home}/.config/Red-DiscordBot/config.json") do
  its(['Baphomet','DATA_PATH']) { should eq bots }
end