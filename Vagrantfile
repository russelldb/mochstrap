Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.provisioner = :chef_solo
  config.chef.cookbooks_path = "cookbooks"

  config.vm.box = "moch_strap" # this box can be found @[tbc] use vagrant box add erlang_webdev [tbc]
  config.vm.forward_port("web", 80, 8080)
end
