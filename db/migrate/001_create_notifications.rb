class CreateNotifications < ActiveRecord::Migration
  def up
    create_table :notifications do |t|
      t.references :user
      t.integer    :notifiable_id
      t.string     :notifiable_type

      t.datetime :planning_send_at
      t.datetime :sent_at

      t.integer  :kind # mail sms etc
      t.string   :content
      t.string   :sid # sidekiq id, can be null eg when sidekiq finish the job
      t.string   :gid # gateway id, can be null eg for emails
    end
  end

  def down
    drop_table :notifications
  end
end
