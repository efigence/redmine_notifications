class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notifiable, :polymorphic => true
  after_commit :prepare_send_task
  after_destroy :remove_job_from_quene

  def deliver
    if sent_at.blank?
      # use proper adapter
      adapter_class = Notifications.adapters[kind.to_sym]
      if adapter_class
        adapter = adapter_class.new(self)
        adapter.deliver
        self.sent_at = DateTime.now
        self.save
      end
    end
  end


  def prepare_send_task
    if self.sid.blank?
      Rails.logger.debug self.inspect
      Rails.logger.debug id.inspect
      send_at = Time.zone.parse(planning_send_at.to_s(:db))
      sid = SendNotification.perform_at(send_at, id)
      self.sid = sid
      self.save
    end
  end

  def remove_job_from_quene
    delayed = Sidekiq::ScheduledSet.new
    job = delayed.find_job(self.sid)
    job.delete if job
  end
end
