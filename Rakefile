require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'csv'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# Is this the correct location for the import of csv and assignment to objects?
desc 'Imports CSV data into database and creates ORMs'
task :import do
  ImportCsv.insert_data
end
