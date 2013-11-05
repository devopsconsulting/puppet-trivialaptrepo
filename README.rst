puppet-trivialaptrepo
=====================

Set up an extremely simple apt-repo with puppet.

If you place .deb's in a repo folder, the Packages.gz
will be regenerated automatically.

Create a repository server
--------------------------

Standard on server hostname on port 80::

    class {"trivialaptrepo":}

On a subdomain on a different port::

    class {"trivialaptrepo":
        hostname => 'repo.example.com',
        port => '90'
    }


Create some repos in the repository server
------------------------------------------

::

    trivialaptrepo::repo{"example/main":}
    trivialaptrepo::repo{"example/dev":}
    trivialaptrepo::repo{"example/toys":}


Use the repos with puppet-apt
-----------------------------

::

    apt::source { "example-main":
        location          => "http://repo.example.com/example/",
        release           => "main/",
        repos             => "",
        include_src       => false
    }

    apt::source { "example-main":
        location          => "http://repo.example.com/example/",
        release           => "dev/",
        repos             => "",
        include_src       => false
    }

    apt::source { "example-main":
        location          => "http://repo.example.com/example/",
        release           => "toys/",
        repos             => "",
        include_src       => false
    }
