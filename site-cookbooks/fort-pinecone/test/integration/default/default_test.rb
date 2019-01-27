# # encoding: utf-8

# Inspec test for recipe jameskiefer::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Users

describe user('root') do
	it { should exist }
end

describe user('zinefer') do
	it { should exist }
end

describe user('sibicle') do
	it { should exist }
end

# Ports

describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

# Packages

describe package('nginx') do
  it { should be_installed }
end

# Service testing

describe command("curl --cacert /root/cacert.pem --resolve 'jameskiefer.com:443:127.0.0.1' https://jameskiefer.com/") do
 its("stdout") { should match "Maintenance" }
end