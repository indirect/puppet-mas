# Mac App Store Puppet Module for Boxen

A module which installs [Mac App Store](http://www.apple.com/ca/osx/apps/app-store/) apps via a provider for Puppet's `package` type.

## Usage

```puppet
include mas
```

Now you can list packages to install in Hiera!

```yaml
mas::account: my.itunes@account.net
mas::apps:
  CloudApp: 417602904
  Simplenote: 692867256
```

You can also install apps via puppet, if you really want to:

```puppet
package { '417602904': provider => 'mas' }
```

## Required Puppet Modules

 - `homebrew`, >= 1.10.0

## Work in progress

Please contribute by reporting issues and submitting pull requests!
