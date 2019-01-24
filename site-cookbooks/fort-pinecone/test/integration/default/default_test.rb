# # encoding: utf-8

# Inspec test for recipe jameskiefer::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('root') do
	it { should exist }
end

describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end
