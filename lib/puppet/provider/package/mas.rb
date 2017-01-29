require 'puppet/provider/package'
require "puppet/util/execution"

Puppet::Type.type(:package).provide(:mas, :parent => Puppet::Provider::Package) do
  include Puppet::Util::Execution

  confine :operatingsystem => :darwin
  commands :mas => "mas"

  def self.instances
    mas_installed.map do |app|
      new(name: app[:id], ensure: :present, version: app[:version])
    end
  end

  def self.mas_parse(action)
    mas(action).lines.map do |line|
      app = line.scan(/(\d+) (.+) \(([0-9.]+)\)/).first
      { id: app[0], name: app[1], version: app[2] }
    end
  end

  def self.mas_installed
    @mas_installed ||= mas_parse('list')
  end

  def query
    app = self.class.mas_installed.find{|a| a[:id] == resource[:name] }
    app ? { name: app[:id], ensure: app[:version] } : nil
  end

  def install
    execute [ "mas", "install", resource[:name] ], :uid => Facter.value(:boxen_user)
  end

  def uninstall
    raise Puppet::Error, "Uninstalling Mac App Store apps is not yet possible."
  end

  # def self.mas_outdated
  #   @mas_outdated ||= mas_parse('outdated')
  # end
  #
  # def latest
  #   self.class.mas_outdated.map(&:name).include?(resource[:name])
  # end
  #
  # def update
  #   installed? ? install : mas('upgrade')
  # end
end
