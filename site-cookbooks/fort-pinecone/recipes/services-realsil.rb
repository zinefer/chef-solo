#
# Cookbook:: fort-pinecone
# Recipe:: sevices-realsil
#
# Copyright:: 2019, The Authors, All Rights Reserved.

static_website 'realsil' do
  domain 'realsil.net'
  git 'https://github.com/zinefer/realsil.net.git'
end