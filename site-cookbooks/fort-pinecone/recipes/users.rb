#
# Cookbook:: fort-pinecone
# Recipe:: users
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user_account 'root' do
  password '$6$purhGOAh$YG6Mbmk3zylRUTX2u6.eF4aa9XX70iCQdSViUUfl1DE4JCJPrmBxy.KP/2LkmpdYBdC3p4ofEQmKsdjTxiNnq.'
end

user_account 'zinefer' do
  ssh_keys 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMnLbooh0Y/mclQ+Vp35nJ690IYheDUE6+aWBTvT8wDfaLjL/Z0NUBqRown4OR2Y7AhKgIi3WnpXQGaLhdmeMzgg6OPCUj13m+XJGy7VolL5ASjQLAT3vrf7iSR3PAENglOIT+CFxrNvbj5JEzMtfSy9EnwWgB7jerV9CADCrDMG9nlHgqwczYx1LI8rjGh6N39bkzLI8fuChq0q6OLq5e1KvBje8Z99r7wyUrVDBTc3wZcrY3NV9UoJ/abI3UMnIKsuYAnsqEOnn+723GD7WW8hGQICdpzhZyP0+MNbqvbeT9ZCHZ+6u2POcFf4IaFQ8+cLLSNvDqbYOjYTico+tr0KRlZHv3C3NS4TrTYU0SMcNVEg3VStxQ+z6OWFKxBughdowB2vXqPxAF+hwdQpExMoP9bRFS00TSR2GCNdyzCSacNUVuofB6EamqwQlfvY7wJ5wAMf8S/bTC1q2NRqJQ32+XBSU2t2EzASzP59DWhRCFBTQXBDezYusIo03RrEReZD26Icpv+764PRsDHae54xuTJ4ONMHYXTQi9qaitmjm3LsgFbB0/MjuucsJJNRmJf5I73HGaLkmrsaFT53V0JYSF5W22Ygl+Jui7GNyuyVG/54JqMPueaLECW8fFPfODnhdVOBKI59LJxUQAqsatinJ5JBf01YK2xShPNtjjew=='
  password '$6$ECCXDX8C8gLAVB$dikx5jwEB5XkRQ8.m.FH6a97Ajp3Sv8A/BN52AxgL3igC0nF8RzR5EmDida/PmZEfWzrojUs4qCBUyrGN7ruW1'
end

sudo 'zinefer' do
  user 'zinefer'
end

user_account 'sibicle' do
  ssh_keys [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2UsEI1WXzuNbEuDnG8EjI3S5vc3eLvb1FcPGlET8YcdRJHeenBKm/Dd9A6hX1pSkn2jBnXCnAStwF+d9/W6dRBblybyiDje4U0ANBQynnC1hzo0dCVIQydEVO/Bs3A1Gi9mrR70nuQWGS6z2v4EAn1CrWuphO7NUfR6oZi59pXJu8cTmOi/v2FImgxBtX2D3UBEVGm90xmRA968mfjIaitOY+9UY60M95R4G5sLh/ooNeuYfC1TTKTlLBACVYVKNo6E9hzQsH8wG8vkQ6Z2JtDqCKUQkcpkproD4bDxzHflqyNZJi91cF35Aowmwhul/J933p0GX8CkTvH+SUDPRJ jason@Keille.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBeLvfNXT1ayuas+rTb0jDYMzkwt54QMaO5wrt7/E7ojXcpN2jC6Gui/mijW7wDDRMeWmKrHkMuik1zDEmc3hsmbWjylYJQHM8+qxBN5WfJtGwdWzTvGEb8g9F5esH/saJQO90Q9ATNcjBIuBOJmPT/I/jNVHiFDSvOu4VVoE9qMTztGwTYPCEjYlVG98CtdDU+1pdyolrHO9VHRYEq1jIR4LRHBj0YnpGDcAaKVixyTr4nLpm2hoab9cTfUqDoozBck7Mca2C58jlAWe1kqIyFPnG940uZo2jat+KUO500XV3ALpNWeDG0XtERA1EzAOuuTDlJGC6lIpt/vbFyHdp jason@Bain.local'
           ]
end

sudo 'sibicle' do
  user 'sibicle'
end