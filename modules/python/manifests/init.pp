# --                                                            ; {{{1
#
# File        : modules/python/manifests/init.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

class python {
  package { [ 'python', 'python-dev', 'python-pip',
              'python-virtualenv' ]:
    ensure => 'installed',
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
