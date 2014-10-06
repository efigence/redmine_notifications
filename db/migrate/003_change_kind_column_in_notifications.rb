class ChangeKindColumnInNotifications < ActiveRecord::Migration
  def change
    change_column :notifications, :kind, :string, null: false
  end
end
