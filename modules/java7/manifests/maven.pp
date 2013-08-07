# --                                                            ; {{{1
#
# File        : modules/java7/manifests/maven.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

class java7::maven {
  include java7::jdk

  exec { '[package] maven':
    command   => 'aptitude install -y -R maven',
    creates   => '/usr/share/doc/maven',
    logoutput => true,
    require   => Exec['[package] openjdk-7-jdk'],
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
