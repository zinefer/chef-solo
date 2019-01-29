These are configuration files for various services that I manage.

## Workstation setup

```
gem install chef
gem install chef-dk # Only needed to create cookbooks
gem install knife-solo
gem install knife-solo_data_bag
gem install librarian-chef

export EDITOR=$(which vi)


# Clone repo

# Download/Update cookbook dependancies
librarian-chef install
```
## Create Cookbook

```
chef generate cookbook site-cookbooks/cookbook-name
```

## Server setup

```
# Prepare server (-P for password auth)
knife solo prepare user@host
```

## Server deploy

```
knife solo cook user@host
knife solo clean user@host
```

## Testing

- Install VirtualBox 
- Add `C:\Program Files\Oracle\VirtualBox` to windows PATH

```
wget https://releases.hashicorp.com/vagrant/2.2.3/vagrant_2.2.3_x86_64.deb
sudo dpkg -i vagrant_2.2.3_x86_64.deb
```

- Install Vagrant for Windows (versions must match)

```
gem install kitchen 
gem install kitchen-vagrant
gem install kitchen-inspec

echo 'export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
echo 'export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/Users/username/Documents/"' >> ~/.bashrc

vagrant plugin install vagrant-vbguest
```

### Running the suite

```
kitchen create
kitchen converge
kitchen verify
kitchen destroy
```
or
```
kitchen test
```
