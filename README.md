This is a quick proof-of-concept for installing the ScaleFT Server Agent on Slackware with Puppet.

### Caveats

* Unfortunately my quick search didn't turn up a 64-bit Slackware Vagrant box with Puppet pre-installed, so our 64-bit binaries aren't compatible with this VM. The installation succeeds though.
* This puppet manifests hard-codes the version of our agent. You'll want to improve this in your production automation.
* This repo includes an enrollment.token file which is for my personal environment. Please don't use this token in your prod env.
