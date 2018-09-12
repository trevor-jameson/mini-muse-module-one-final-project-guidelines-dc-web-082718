ActiveRecord::Base.logger = nil

# Call Screen.clear to clear screen before moving to another 'page' in interface
module Screen
   def self.clear
       print "\ec\e[3J"
   end
end

module Interface
  def self.welcome
    Artscii.welcome
    print "Welcome to Mini-Muse! The data analytics app for the 500 greatest albums of all time.\n\nEnter any key to begin: "
    # Loop will break once any input is entered
    user_input = nil
    while user_input == nil
      user_input = gets
    end
    Screen.clear
  end


  def self.main_menu
    # This will loop until the user enters a valid option
    user_exit = true
    while user_exit
      print <<-TEXT
What would you like to learn about today?
  1. List of all artists, albums, or genres
  2. Info from a specific decade
  3. Info about an artist
  4. Info about a genre
  5. Close program
      TEXT
      print "  Input: "
      user_input = gets.chomp

      # Evaluate user input
      case user_input
      when "1"
        # Choose from artist, album, or genre
        self.all_things_1
        user_exit = false
      when "2"
        # Choose decade from pre-determined list 50s to 2000s
        self.decade_2
        user_exit = false
      when "3"
        # Choose artist, return top 3 most popular albums
        self.artist_3
        user_exit = false
      when "4"
        # Choose genre, return top 3 most popular albums
        self.genre_4
        user_exit = false
      when "5"
        #exit the program
        puts "Goodbye!"
        return
      end
    end
        "Please select a valid option"
  end


  def self.all_things_1
    while true
    print <<-TEXT
    Would you like to see all artists, albums, or genres in the top 500?
    1. Artist
    2. Albums
    3. Genres
    4. Main Menu
    Input:
    TEXT
    user_input = gets.chomp
    case user_input
    when "1"
      Artist.get_all_names
    when "2"
      Album.get_all_names
    when "3"
      Genre.get_all_names
    when "4"
      self.main_menu
    end
    "Please select a valid option"
    end
  end


  def self.decade_2
    decade_loop_active = true
    Screen.clear
    while decade_loop_active
    print <<-TEXT
    Which decade would you like to view?
    1. 1950s
    2. 1960s
    3. 1970a
    4. 1980s
    5. 1990s
    6. 2000s
    7. 2010s
    8. Main Menu
    TEXT
    print "\tInput: "

    # Get user input
    user_input = gets.chomp
    case user_input
    when "1"
      input_years = 1950..1959
      decade_loop_active = false
    when "2"
      input_years = 1960..1969
      decade_loop_active = false
    when "3"
      input_years = 1970..1979
      decade_loop_active = false
    when "4"
      input_years = 1980..1989
      decade_loop_active = false
    when "5"
      input_years = 1990..1999
      decade_loop_active = false
    when "6"
      input_years = 2000..2010
      decade_loop_active = false
    when "7"
      input_years = 2011..2020
      decade_loop_active = false
    when "8"
      decade_loop_active = false
      return # Will this return to main menu method?
    end
  end
  Screen.clear
  print <<-TEXT
  What info would you like to view from this decade?
  1. Top 5 albums
  2. Top 5 artists
  TEXT
  print "\tInput: "

end


  def self.decade_2_1
    # print top 5 albums from chosen decade (need input_years in range(1950..1959))
    info = nil
    while info != "1" || info != "2" || info != "3"
      Screen.clear

    info = gets.chomp
    end
    Album.top5_album_from_decade(input_years)
  end

  def self.decade_2_2
    # print top 5 artists from chosen decade (need input_years in range(1950..1959))
    info = nil
    while info != "1" || info != "2" || info != "3"
    Screen.clear
    print <<-TEXT
    What info would you like to view from this decade?
    1. Top 5 albums
    2. Top 5 artists
    TEXT
    print "  Input: "
    info = gets.chomp
    end
    Album.top5_artist_from_decade(input_years)
  end

  # End of class definition
end
