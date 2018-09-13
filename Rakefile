require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'csv'
require_relative 'db/seeds.rb'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# Is this the correct location for the import of csv and assignment to objects?
desc 'import commands'
namespace :import do
  desc 'Imports artist data into database and creates ORMs'
  task :artist do
    ImportCsv.insert_artist_data
  end

  desc 'Import genre data into database'
  task :genre do
    ImportCsv.insert_genre_data
  end

  desc 'Import album data into database'
  task :album do
    ImportCsv.insert_album_data
  end

  desc 'Import album_genre data into database'
  task :albumgenre do
    ImportCsv.insert_albumgenre_data
  end

  # Rake import:all drops previous tables from greatest_albums.db and recreates and seeds the DB from the CSV
  desc 'Import all data from csv'
  task :all do
    Rake::Task['db:reset'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['import:artist'].invoke
    Rake::Task['import:genre'].invoke
    Rake::Task['import:album'].invoke
    Rake::Task['import:albumgenre'].invoke
    Rake::Task['db:migrate:status'].invoke
  end

end
