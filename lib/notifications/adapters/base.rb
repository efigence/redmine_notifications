module Notifications
  class AdapterBase
    def initialize(notification)
      @notification = notification
    end

    def deliver
      raise 'Implement me!'
    end
  end
end
