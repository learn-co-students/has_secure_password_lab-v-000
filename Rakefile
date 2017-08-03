# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :migrate do
  system('rake db:migrate && rake db:migrate RAILS_ENV=test')
end

task :drop do
  system('rm db/development.sqlite3 && rm db/schema.rb && rm db/test.sqlite3')
end
