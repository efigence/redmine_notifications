class SendNotification
  include Sidekiq::Worker

  sidekiq_options queue: :notifications,
    backtrace: true
    # unique: true,
    # unique_job_expiration: 120 #* 60 # 2 hours

  def perform(notification_id)
    puts "Sending notification #{notification_id}"
    notification = Notification.find(notification_id)
    notification.deliver if notification.sent_at.blank?
  end
end
