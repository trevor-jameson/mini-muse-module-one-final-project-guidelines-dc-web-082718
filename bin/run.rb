require_relative '../config/environment'
# require "sinatra/activerecord/rake"

# rake = Rake.application
# rake.init
# rake.load_rakefile

# rake["db:reset"].invoke
# rake["db:migrate"].invoke
# rake["import:artist"].invoke
# rake["import:genre"].invoke
# rake["import:album"].invoke
# rake["import:albumgenre"].invoke
Screen.clear
Interface.welcome
Interface.main_menu
