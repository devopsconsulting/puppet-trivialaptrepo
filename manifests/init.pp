class aptrepo($hostname=$::hostname, $port='80') {
    class {'aptrepo::install':} ->
    class {'aptrepo::config':
        hostname => $hostname,
        port => $port,
    } ~>
    class {'aptrepo::service':}
}