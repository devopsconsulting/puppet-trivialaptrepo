class trivialaptrepo($hostname=$::hostname, $port='80') {
    class {'trivialaptrepo::params':} ->
    class {'trivialaptrepo::install':} ->
    class {'trivialaptrepo::config':
        hostname => $hostname,
        port => $port,
    } ~>
    class {'trivialaptrepo::service':}
}
