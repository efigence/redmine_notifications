require 'notifications/adapters/registry'

module Notifications

  def self.adapters=(new_registry)
    @adapters = new_registry
  end

  def self.adapters
    @adapters ||= Notifications::AdapterRegistry.new
  end
end


# This stuff needs to be run after Notifications is defined.
require 'notifications/adapters/base'
require 'notifications/adapters/mail'
require 'notifications/adapters/sms'
