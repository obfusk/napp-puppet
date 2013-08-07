# --                                                            ; {{{1
#
# File        : manifests/aptitude.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

Package {
  ensure    => installed,
  provider  => 'aptitude',
}

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
