# --                                                            ; {{{1
#
# File        : manifests/site.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-08-06
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

Exec {
  path => [
    $pp_script_path, '/usr/local/sbin', '/usr/local/bin',
    '/usr/sbin', '/usr/bin', '/sbin', '/bin'
  ]
}

Package {
  ensure    => installed,
  provider  => 'aptitude',
}

git::repo { "/home/$id/__TEST__/napp-puppet":
  source  => 'https://github.com/obfusk/napp-puppet.git',
  branch  => 'dev',
  pull    => true,
}

# vim: set tw=70 sw=2 sts=2 et fdm=marker :
