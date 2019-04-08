resource_name :static_website

property :name,         String,          required: true
property :domain,       [Array, String], required: true

property :git,          [String, false], default: false

default_action :create

action :create do

    web_root = "/var/www/#{new_resource.name}"

    acme_selfsigned new_resource.domain do
      crt       "/etc/ssl/#{new_resource.domain}.crt"
      key       "/etc/ssl/#{new_resource.domain}.key"
    end

    nginx_site new_resource.domain do
      template  'nginx-static-site.conf.erb'
      variables name: new_resource.name, domain: new_resource.domain
      notifies  :reload, 'service[nginx]', :immediately
    end

    directory web_root do
      recursive true
    end

    if new_resource.git
      git web_root do
        repository new_resource.git
      end
    else
      file "#{web_root}/index.html" do
        content   'Maintenance'
        action :create_if_missing
      end
    end

    acme_certificate new_resource.domain do
      crt       "/etc/ssl/#{new_resource.domain}.crt"
      key       "/etc/ssl/#{new_resource.domain}.key"
      wwwroot   web_root
      notifies  :reload, 'service[nginx]'
    end

    node.default['aws']['cloudwatch']['nginx_log_files'] << new_resource.name
end