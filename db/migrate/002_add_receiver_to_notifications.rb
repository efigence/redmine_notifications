class AddReceiverToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :to, :string, null: false
  end
end
