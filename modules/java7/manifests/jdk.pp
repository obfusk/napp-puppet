# --                                                            ; {{{1
#
# File        : modules/java7/manifests/jdk.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

class java7::jdk {

  exec { '[package] openjdk-7-jdk':
    command   => 'aptitude install -y -R openjdk-7-jdk',
    creates   => '/usr/share/doc/openjdk-7-jdk',
    logoutput => true,
  }

}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
