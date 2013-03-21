class trivialaptrepo::config($hostname, $port) {
    file {"${trivialaptrepo::params::reporoot}":
        ensure => 'directory'
    } ->
    file {'/etc/nginx/sites-available/repos':
        ensure => 'present',
        content => template('trivialaptrepo/nginx.conf.erb')
    } ->
    file {'/etc/nginx/sites-enabled/repos':
        ensure => 'link',
        target => '/etc/nginx/sites-available/repos'
    }

    file {'/usr/local/bin/updaterepo.sh':
        ensure => 'present',
        mode => '0755',
        content => template('trivialaptrepo/updaterepo.sh.erb')
    }
}