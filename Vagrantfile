Vagrant.configure(2) do |config|

  # config.vm.synced_folder "./html", "/var/www/html"
  config.vm.provision :shell, path: "base_enviroment.sh"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/vagrant/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = ENV['DIGITAL_OCEAN_TOKEN']
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'sgp1'
    provider.size = '512mb'

    config.vm.hostname = "Droplet-Name"
  end
end
