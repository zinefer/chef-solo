#
# Cookbook:: fort-pinecone
# Recipe:: metrics
#
# Copyright:: 2019, The Authors, All Rights Reserved.

access_key_id     = data_bag_item('aws', 'credentials')['access_key_id']
secret_access_key = data_bag_item('aws', 'credentials')['secret_access_key']

directory 'root/.aws'

file 'root/.aws/config' do
  content "[AmazonCloudWatchAgent]\nregion=us-east-2\noutput=json"
end

file 'root/.aws/credentials' do
  content "[AmazonCloudWatchAgent]\naws_access_key_id = #{access_key_id}\naws_secret_access_key = #{secret_access_key}"
end

aws_cloudwatch_agent 'default' do
  action          [:install, :configure, :restart]
  json_config     'amazon-cloudwatch-agent.json.erb'
end