# # encoding: utf-8

# Inspec test for recipe jameskiefer::service-rocketchat

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command("node --version") do
 its('stdout') { should match 'v8.11.4' }
end

describe package('graphicsmagick') do
  it { should be_installed }
end

describe directory('/opt/Rocket.Chat') do
  it { should exist }
end

describe command("curl --max-time 10 --retry 20 --retry-delay 10 --cacert /root/cacert.pem --resolve 'chat.jameskiefer.com:443:127.0.0.1' https://chat.jameskiefer.com/") do
  its("stdout") { should match "chat" }
end

# Make sure we didn't expose raw rocket chat to the internet
describe port(3000) do
  it { should be_listening }
  its('addresses') { should eq ['127.0.0.1'] }
end