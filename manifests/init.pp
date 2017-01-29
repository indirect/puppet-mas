# == Class: mas
#
# Installs the `mas` binary and signs in to the app store
#
class mas ($account = undef) {
  require homebrew

  # exec { 'brew install mas':
  #   unless => 'mas version',
  #   onlyif => 'brew --version',
  # }
  #
  # exec { 'mas account login':
  #   command     => "mas signin ${account} --gui",
  #   unless      => 'mas account',
  #   require     => Homebrew['mas'],
  # }
}
