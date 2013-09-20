package {['emacs-nox', 'lsof', 'strace']:
  ensure => present
}
host { 'localhost':
  ensure => 'present',
  ip => ['127.0.0.1'],
  host_aliases => 'localhost.domain',
}

host { 'puppet.burt.vm':
  ensure       => 'present',
  host_aliases => ['puppet', 'master'],
  ip           => '192.168.60.10',
}

host { 'slave.burt.vm':
  ensure       => 'present',
  host_aliases => ['slave'],
  ip           => '192.168.60.11',
}

node 'slave.burt.vm' {
  package { 'puppet':
    ensure => 'present',
  }

  class {'puppetconf':
    master => false
  }
}

node 'puppet.burt.vm' {
  package { 'puppet-server':
    ensure => 'present',
  }
  service {'puppetmaster':
    ensure => 'running',
    require => Package['puppet-server'],
  }

  file { '/etc/puppet/autosign.conf':
    ensure => 'present',
    notify => Package['puppet-server'],
    content => "*\n",
  }

    service {'iptables':
      ensure => 'stopped',
    }

  class {'puppetconf':
    master => true
  }
}
