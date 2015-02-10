class trivialaptrepo::service {
    service {'incron':
        ensure => 'running'
    }

    if (!defined(Service['nginx'])) {
        service {'nginx':
            ensure => 'running'
        }
    }
}