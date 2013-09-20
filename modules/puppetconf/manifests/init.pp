class puppetconf (
  $master = false,
  ) {

    if $master {
      file { '/etc/puppet/puppet.conf':
        ensure => 'present',
        source => 'file:///vagrant/files/puppet.conf',
        owner => 'root',
        group => 'root',
        before => Service['puppetmaster'],
        require => Package['puppet-server'],
        }
    } else {
        file { '/etc/puppet/puppet.conf':
          ensure => 'present',
          source => 'file:///vagrant/files/puppet.conf',
          owner => 'root',
          group => 'root',
        }
    }
  }
