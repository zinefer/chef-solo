# # encoding: utf-8

# Inspec test for recipe jameskiefer::gitlab

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command("curl --cacert /root/cacert.pem --resolve 'git.pinecone.industries:443:127.0.0.1' https://git.pinecone.industries/") do
  its("stdout") { should match "gitlab" }
end

# Make sure we didn't expose gitlab without https to the internet
describe port(8080) do
  it { should be_listening }
  its('addresses') { should eq ['127.0.0.1'] }
end