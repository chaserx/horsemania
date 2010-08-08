# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :horsemania do
  desc "Create the permalinks for the Locations."
  task :create_permalinks => :environment do
    puts "Creating all permalinks for locations..."
    Location.all.map(&:save)
    puts "Permalinks finished!"
  end
end
