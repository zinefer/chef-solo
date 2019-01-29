#
# Cookbook:: fort-pinecone
# Recipe:: setup_apps
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Install nginx
include_recipe 'nginx'

# Let's Encrypt Automatic Certificate Management Environment
include_recipe 'acme'

include_recipe 'fort-pinecone::services-jameskiefer'
include_recipe 'fort-pinecone::services-baphomet'
include_recipe 'fort-pinecone::services-rocketchat'