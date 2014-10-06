require_relative 'sms/smsapi'

module Notifications
  class AdapterSms < AdapterBase
    attr_reader :gateway

    def initialize(notification)
      super
      @gateway = Smsapi.new(notification)
    end

    def deliver
      gateway.deliver
    end
  end
end

Notifications.adapters.register Notifications::AdapterSms, :sms
