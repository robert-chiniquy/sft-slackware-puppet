# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = "virtualbox"


$configure = <<EOBASH

puppet apply -v manifests/scaleft.pp

EOBASH


Vagrant.configure("2") do |config|
  config.vm.box = "n00bsys0p/slackware32-puppet"
  config.vm.provision :shell, :inline => $configure
end
