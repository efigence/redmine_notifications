module Notifications
  class AdapterMail < AdapterBase
    def deliver
      NotificationsMailer.notification(@notification).deliver
    end
  end
end

Notifications.adapters.register Notifications::AdapterMail, :mail
