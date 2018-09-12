ActiveRecord::Base.logger = nil

# Call Screen.clear to clear screen before moving to another 'page' in interface
module Screen
   def self.clear
       print "\ec\e[3J"
   end
end

class Interface

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
    user_input = nil
    # This will loop forever, until the user enters a valid option
    while true
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
        when "2"
          # Choose decade from pre-determined list 50s to 2000s
          self.decade_2
        when "3"
          # Choose artist, return top 3 most popular albums
          self.artist_3
        when "4"
          # Choose genre, return top 3 most popular albums
          self.genre_4
          # print top 5 albums from chosen genre
          Genre.top5_albums(genre_name)

          # print top 5 artists from chosen genre
          Genre.top5_artists(genre_name)

        when "5"
          #exit the program
            puts "Goodbye!"
          return
        end
        "Please select a valid option"
      end
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

  # print top 5 artists from chosen decade (need input_years in range(1950..1959))
  Album.top5_artist_from_decade(input_years)

  # print top 5 albums from chosen decade (need input_years in range(1950..1959))
  Album.top5_album_from_decade(input_years)

end





  def self.artist_3

  end

  # End of class definition
end
