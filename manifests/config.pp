class aptrepo::config($hostname, $port) {
    file {"${aptrepo::params::reporoot}":
        ensure => 'directory'
    } ->
    file {'/etc/nginx/sites-available/repos':
        ensure => 'present',
        content => template('aptrepo/nginx.conf.erb')
    } ->
    file {'/etc/nginx/sites-enabled/repos':
        ensure => 'link',
        target => '/etc/nginx/sites-available/repos'
    }

    file {'/usr/local/bin/updaterepo.sh':
        ensure => 'present',
        mode => '0755',
        content => template('aptrepo/updaterepo.sh.erb')
    }
}