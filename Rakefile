#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Arpabet::Application.load_tasks

desc "Import the CMU dictionary into the database"
task(:import_cmudict => :environment) do
  Word.import_cmudict
end
