# --                                                            ; {{{1
#
# File        : modules/python/manifests/venv.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-07
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

class python::venv (
  $src    = '/opt/src',
  $bin    = '/opt/bin',
  $sname  = 'venv',
  $bname  = 'venv',
  $pull   = true,
) {

  include python

  git::repo { "${src}/${sname}":
    source  => 'https://github.com/obfusk/venv.git',
    pull    => $pull,
  }

  file { $bin:
    ensure  => 'directory',
  }

  file { "${bin}/${bname}":
    ensure  => link,
    target  => "${src}/${sname}",
  }

}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
