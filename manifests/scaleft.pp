

file { '/var/lib/sftd':
    ensure => 'directory',
}

# Note: This enrollment token is for my personal environment.
# You'll want to replace this value for your production fleet.

file { 'enrollment token':
    ensure  => 'present',
    path    => '/var/lib/sftd/enrollment.token',
    source  => '/vagrant/enrollment.token',
    require => File['/var/lib/sftd']
}

# Note: This manifest is pinned to a specific version of the ScaleFT Agent.
# You'll want to ensure your production fleet is running relatively up-to-date versions of the Agent.

exec { "Fetch Slackware package for ScaleFT Server Agent via https":
    command => "/usr/bin/curl -O https://dist.scaleft.com/server-tools/linux/v1.23.5/scaleft-server-tools-1.23.5-amd64-1.txz",
    cwd => "/vagrant",
    require => File['enrollment token']
}

exec { "Install ScaleFT Server Agent with installpkg":
    command => "/sbin/installpkg /vagrant/scaleft-server-tools-1.23.5-amd64-1.txz",
    cwd => "/vagrant",
    require => Exec["Fetch Slackware package for ScaleFT Server Agent via https"]
}

# To restart services
exec { "Call sysvinit at runlevel 3":
    environment => ["RUNLEVEL=3"],
    command => "/etc/rc.d/rc.sysvinit"
}