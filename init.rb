# encoding: utf-8
require 'redmine'

# adding the user patch
require 'user_patch'
require 'notifications'

if Rails::VERSION::MAJOR < 3
  require 'dispatcher'
  object_to_prepare = Dispatcher
else
  object_to_prepare = Rails.configuration
  # if redmine plugins were railties:
  # object_to_prepare = config
end


Redmine::Plugin.register :redmine_notifications do
  name 'Notifications plugin'
  author 'Rafał Lisowski'
  description 'A plugin for notifications.'
  version '0.0.1'
  url 'http://www.efigence.com'
  author_url 'http://www.efigence.com'

  requires_redmine :version_or_higher => '0.9.0'

  # requires_redmine_plugin gaves us nothing since redmine load plugins one by one
  # see http://www.redmine.org/issues/6324 for details
  # even modification for plugins in config/additional_environment.rb change nothing
  #   config.plugins = [ :redmine_sidekiq, :all ]
  # requires_redmine_plugin :redmine_sidekiq, :version_or_higher => '1.1.0'

  settings(:default => {
             'smsapi_username' => '',
             'smsapi_password' => '',
             'test' => '1',
             'proxy_host' => 'example.com',
             'proxy_port' => '3128',
             'ssl_ca_file' => '/etc/pki/tls/certs/ca-bundle.crt',
  }, :partial => 'settings/notifications_settings')

end

HttpLog.options[:logger] = Rails.logger
