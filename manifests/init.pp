# == Class: mas
#
# Installs the `mas` binary from homebrew and signs in
#
class mas (
  $account  = undef
) {
  require homebrew

  package { 'mas': provider => "homebrew" }

  if $account {
    exec { 'mas account login':
      command     => "mas signin ${account}",
      unless      => 'mas account',
      require     => Homebrew['mas'],
    }
  }
}
