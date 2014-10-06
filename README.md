Redmine Notifications Plugin
============================

It's using redmine_sidekiq plugin as a dependencie so make sure you have it - http://www.redmine.org/plugins/sidekiq.
Notification are stored in sidekiq notifications quene.

This plugin is for other plugins to make simple notification system, eg: [This Plugin](https://github.com/efigence/redmine_resources_management) using Notifications from here.

It's dependent from [Redmine Sidekiq](https://github.com/ogom/redmine_sidekiq)


# Instalation
  1. Go to your Redmine installation's plugins/ directory.
  2. `git clone git@github.com:efigence/redmine_notifications.git && cd ..`
  3. `bundle exec rake redmine:plugins:migrate NAME=redmine_notifications_plugin RAILS_ENV=production`
  4. `bundle exec sidekiq -q notifications -q default`
  5. Restart Server.
  6. Set your own configuration -> Admin/Notificaitons Plugin

When you `start sidekiq` make sure you pass `-q` option 
eg: `$ bundle exec sidekiq -q notifications -q default`

# Configuration
This is sample sidekiq configuration:
```
---
:verbose: false
:pidfile: ./tmp/pids/sidekiq.pid
:logfile: ./log/sidekiq.log
:concurrency:  6
:queues:
  - [default, 1]
  - [notifications, 2]
production:
  :logfile: some_path/redmine/current/log/sidekiq.log
  :pidfile: some_path/redmine/current/tmp/pids/sidekiq.pid
```

# License
Copyright (C) 2014  efigence S.A.

Plugin for Redmine Notifications
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
