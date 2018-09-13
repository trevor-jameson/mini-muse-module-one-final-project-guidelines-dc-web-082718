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
\nWhat would you like to learn about today?
  1. List of all artists, albums, or genres
  2. Info from a specific decade
  3. Info about an artist
  4. Info about a genre
  5. Close program
      TEXT
      print "  \nInput: "
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
        when "5"
          #exit the program
            puts "Goodbye!"
          break
        else
          puts "\nPlease select a valid option."
        end
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
    Screen.clear

    artist_loop_active = true
    while artist_loop_active
    print <<-TEXT
  \nWhat information do you want to know about an artist?
    1. Get top 3 albums by a specific artist
    2. Get the most popular album by a specific artist
    3. Go to Main Menu
    TEXT
    print "\nInput: "
    user_input = gets.chomp

    case user_input
    when "1"
      #print top 3 albums from chosen artist
      print "Which artist do you want to know about: "
      artist_name = gets.chomp

      puts "\nThis artist's top 3 albums are: "
      Artist.top3_popular_album(artist_name)

    when "2"
      #print top album from chosen artist
      print "Which artist do you want to know about: "
      artist_name = gets.chomp

      print "\nThis artist's top album is: "
      Artist.most_popular_album(artist_name)

    when "3"
      Screen.clear
      artist_loop_active = false
    else
      puts "\nPlease select a valid option.\n"
    end
    end
  end

  def self.genre_4
    Screen.clear

    genre_loop_active = true
    while genre_loop_active
    print <<-TEXT
  \nWhich genre do you want to know about:
    1. Rock
    2. Pop
    3. Funk / Soul
    4. Blues
    5. Jazz
    6. Folk
    7. World & Country
    8. Classical
    9. Stage & Screen
    10. Reggae
    11. Hip Hop
    12. Electronic
    13. Latin
    TEXT
    print "\nInput: "
    genre_id = gets.chomp

    print <<-TEXT
    What information do you want to know about this genre?
      1. Get the top 5 albums from a specific genre
      2. Get the top 5 artists from a specific genre
      3. Go to Main Menu
      TEXT
      print "\nInput: "
      user_input = gets.chomp

    case user_input
    when "1"
      puts "\nThis genre's top 5 albums are: "
      # print top 5 albums from chosen genre
      Genre.top5_albums(genre_id)

    when "2"
      puts "\nThis artist's top 5 artists are: "
      # print top 5 artists from chosen genre
      Genre.top5_artists(genre_id)

    when "3"
      Screen.clear
      genre_loop_active = false
    else
      puts "\nPlease select a valid option.\n"
    end
    end
  end

  # End of class definition
end
