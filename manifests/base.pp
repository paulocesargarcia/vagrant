class base {
  group { "puppet":
    ensure => "present",
  }

  exec { "apt_update":
    command => "apt-get update",
    path    => "/usr/bin"
  }

  package { "vim":
    ensure => present,
  }

}

include base
