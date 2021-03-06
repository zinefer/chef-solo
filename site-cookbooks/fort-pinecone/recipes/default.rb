#
# Cookbook:: fort-pinecone
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'fort-pinecone::packages'

include_recipe 'fail2ban::default'

include_recipe 'fort-pinecone::users'
include_recipe 'fort-pinecone::motd'
include_recipe 'fort-pinecone::services'

include_recipe 'fort-pinecone::metrics'