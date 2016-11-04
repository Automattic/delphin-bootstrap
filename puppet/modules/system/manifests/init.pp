class system {
  include apt
  
  apt::source { "nodejs":
    key => {
      id => "9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280",
      server => "keyserver.ubuntu.com"
    },
    location => "https://deb.nodesource.com/node_6.x",
    release => "precise",
    repos => "main"
  }
  
  apt::source { "yarn":
    key => {
      id => "72ECF46A56B4AD39C907BBB71646B01B86E50310",
      source => "http://dl.yarnpkg.com/debian/pubkey.gpg"
    },
    location => "http://dl.yarnpkg.com/debian/",
    release => "stable",
    repos => "main"
  }
  
  exec { "update":
    command => "/usr/bin/apt-get update",
    require => [Apt::Source["nodejs"], Apt::Source["yarn"]]
  }

  exec { "upgrade":
    command => "/usr/bin/apt-get upgrade --assume-yes",
    path    => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    require => Exec["update"]
  }
}
