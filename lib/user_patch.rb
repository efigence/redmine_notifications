require_dependency 'user'

module UserPatch

  def act_as_notifiable
    class_eval do
      unloadable
      has_many :notifications
    end
  end

  module InstanceMethods
  end
end

User.extend UserPatch
User.act_as_notifiable
