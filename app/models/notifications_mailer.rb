class NotificationsMailer < ActionMailer::Base
  layout 'mailer'

  include Redmine::I18n

  def self.default_url_options
    { :host => Setting.host_name, :protocol => Setting.protocol }
  end

  # Builds a Mail::Message object used to email recipients of the notification.
  #
  # Example:
  #   notification(notification_object) => Mail::Message object
  #   NotificationsMailer.notification(notification_object).deliver => sends an email to notification recipients
  def notification(notification)
    @notification = notification

    mail to: notification.to,
      subject: notification.subject,
      'List-Id' => "<#{notification.notifiable_type}>",
      'X-Mail-Class' => "redmine_notifications_#{notification.notifiable_type}"
  end

end
