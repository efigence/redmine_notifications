Redmine Notifications Plugin
============================

It's using redmine_sidekiq plugin as a dependencie so make sure you have it - http://www.redmine.org/plugins/sidekiq.
Notification are stored in sidekiq notifications quene. 
When you `start sidekiq` make sure you pass `-q` option 
eg:
  `$ bundle exec sidekiq -q notifications -q default`



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
