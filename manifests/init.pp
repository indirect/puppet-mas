# == Class: mas
#
# Installs the `mas` binary and signs in to the app store
#
class mas (
  $account = undef,
  $apps    = undef,
) {
  require homebrew

  package { 'mas': provider => 'homebrew' }

  if $account {
    exec { 'mas account login':
      command     => "mas signin ${account} --dialog",
      unless      => 'mas account',
      require     => Package['mas']
    }
  }

  ensure_resource('package', values($apps), {
    ensure => 'present',
    provider => 'mas'
  })
}
