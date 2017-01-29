# == Class: mas
#
# Installs the `mas` binary and signs in to the app store
#
class mas ($account = undef) {
  require homebrew
  package { 'mas': provider => 'homebrew' }

  exec { 'mas account login':
    command     => "mas signin ${account} --dialog",
    unless      => 'mas account',
    require     => Package['mas']
  }
}
