# # encoding: utf-8

# Inspec test for recipe jameskiefer::service-rocketchat

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


describe package('node') do
  it { should be_installed }
end

describe package('graphicsmagick') do
  it { should be_installed }
end

describe directory('/opt/Rocket.Chat') do
  it { should exist }
end

describe port(3000) do
  it { should be_listening }
end