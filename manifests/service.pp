class trivialaptrepo::service {
    service {'incron':
        ensure => 'running'
    }

    service {'nginx':
        ensure => 'running'
    }
}