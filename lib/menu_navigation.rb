ActiveRecord::Base.logger = nil

# Call Screen.clear to clear screen before moving to another 'page' in interface
module Screen
   def self.clear
       print "\ec\e[3J"
   end

   def self.next
     user_input = nil
     while user_input == nil
       user_input = gets.chomp
     end
   end
end

module Interface
  def self.welcome
    Artscii.welcome
    print "Welcome to Mini-Muse! The data analytics app for the 500 greatest albums of all time.\n\nEnter any key to begin: "
    # Loop will break once any input is entered
    Screen.next
    Screen.clear
  # End of self.welcome definition
  end

  def self.invalid_option
    Screen.clear
    puts "Please select a valid option.\n"
    # End of self.invalid_option
  end

  def self.main_menu
    # This will loop until the user enters a valid option
    loop_active = true
    while loop_active
      print "\nWhat would you like to learn about today?\n\s\s1. List of all artists, albums, or genres\n\s\s2. Info from a specific decade\n\s\s3. Info about an artist\n\s\s4. Info about a genre\n\s\s5. Close program\n\n\s\s\sInput: "
      user_input = gets.chomp

      # Evaluate user input
      case user_input
      when "1"
        # Choose from artist, album, or genre

        self.all_things_1
      when "2"
        # Choose decade from pre-determined list 50s to 2000s
        self.decade_2
        self.main_menu_option_1
      when "2"
        # Choose decade from pre-determined list 50s to 2000s
        self.main_menu_option_2
      when "3"
        # Choose artist, return top 3 most popular albums
        self.artist_3
      when "4"
        # Choose genre, return top 3 most popular albums
        self.genre_4
      when "5"
        #exit the program
        Screen.clear
        puts "\n\n\n\n\n\n\n\s\s\s\s\s\s\s\s\s\s(∗ ･‿･)ﾉ  Goodbye  (∗ ･‿･)ﾉ\n\n\n\n\n\n\n\n\n"
        break
      else
        self.invalid_option
      end
    end
  # End of self.main_menu definition
  end


  def self.main_menu_option_1
    loop_active = true

    while loop_active
      print "Would you like to see all artists, albums, or genres in the top 500?\n\s\s1. Artist\n\s\s2. Albums\n\s\s3. Genres\n\s\s4. Main Menu\n\s\sInput: "
      user_input = gets.chomp
      
      case user_input
      when "1"
        Artist.get_all_names
      when "2"
        Album.get_all_names
      when "3"
        Genre.get_all_names
      when "4"
        loop_active = false
        Screen.clear
      else
        self.invalid_option
      end
    end
  # End of self.main_menu_option_1 definition
  end

  def self.main_menu_option_2
    input_years = 0
    loop_active = true
    Screen.clear
    while loop_active
      # Format this block of text after resolving the end-of-input error
      print "Which decade would you like to view?\n\s\s1. 1950s\n\s\s2. 1960s\n\s\s3. 1970a\n\s\s4. 1980s\n\s\s5. 1990s\n\s\s6. 2000s\n\s\s7. 2010s\n\s\s8. Main Menu\n\s\s\sInput: "

      # Get user input
      user_input = gets.chomp
      case user_input
      when "1"
        input_years = 1950..1959
        loop_active = false
      when "2"
        input_years = 1960..1969
        loop_active = false
      when "3"
        input_years = 1970..1979
        loop_active = false
      when "4"
        input_years = 1980..1989
        loop_active = false
      when "5"
        input_years = 1990..1999
        loop_active = false
      when "6"
        input_years = 2000..2010
        loop_active = false
      when "7"
        input_years = 2011..2020
        loop_active = false
      when "8"
        Screen.clear
        break # Will this break to above menu?
      else
        self.invalid_option
      end
    end
    self.main_menu_option_2_decade(input_years)
  # End of self.main_menu_option_2
  end


  def self.main_menu_option_2_decade(input_years_range)
    Screen.clear
    print "What info would you like to view from this decade?\n\s\s1. Top 5 albums\n\s\s2. Top 5 artists\n\s\s3. Main Menu\n\s\s\sInput: "
    user_input = gets.chomp
    loop_active = true

    while loop_active
      case user_input
      when "1"
        Album.top5_album_from_decade(input_years_range)
        loop_active = false
      when "2"
        Album.top5top5_artist_from_decade(input_years_range)
        loop_active = false
      when "3"
        self.main_menu_option_2
        loop_active = false
      else
        self.invalid_option
      end
    end
  end


  def self.artist_3
    Screen.clear
    loop_active = true
    while loop_active
      print "What information do you want to know about an artist?\n\s\s1. Get the top 3 albums by a specific artist\n\s\s2. Get the most popular album by a specific artist\n\s\s3. Get which genres an artist is part of\n\s\s4. Go to Main Menu\n\s\s\sInput: "
      user_input = gets.chomp

      case user_input
      when "1"
        #print top 3 albums from chosen artist
        print "Which artist do you want to know about: "
        artist_name = gets.chomp

        puts "\nThis artist's top 3 albums are: "
        Artist.top3_popular_album(artist_name)
        Screen.next
      when "2"
        #print top album from chosen artist
        print "Which artist do you want to know about: "
        artist_name = gets.chomp
        print "\nThis artist's top album is: "
        Artist.most_popular_album(artist_name)
        Screen.next
      when "3"
        print "Which artist do you want to know about: "
        artist_name = gets.chomp
        puts "\nThis artist is part of these genres: "
        Artist.genres_part_of(artist_name)
        Screen.next
      when "4"
        Screen.clear
        artist_loop_active = false
      else
        Screen.invalid_input
        Screen.next
      when "4"
        Screen.clear
        loop_active = false
      else
        self.invalid_option
      end
    end
  end

  # Review method ends and formatting
  def self.genre_4
    Screen.clear
    loop_active = true
    genre_id = -1
    while loop_active
      print "\nWhich genre do you want to know about:\n\s\s1. Rock\n\s\s2. Pop\n\s\s3. Funk / Soul\n\s\s4. Blues\n\s\s5. Jazz\n\s\s6. Folk\n\s\s7. World & Country\n\s\s8. Classical\n\s\s9. Stage & Screen\n\s\s10. Reggae\n\s\s11. Hip Hop\n\s\s12. Electronic\n\s\s13. Latin\n\s\s14. Main Menu\n\s\s\n\s\s\sInput: "
      genre_id = gets.chomp
      if genre_id > 0 && genre_id < 14
        loop_active = false
      else
        self.invalid_option
      end
    end
    second_loop_active = true
    while second_loop_active
      print "\nWhat information do you want to know about this genre?\n\s\s\n\s\s1. Get the top 5 albums from a specific genre\n\s\s2. Get the top 5 artists from a specific genre\n\s\s3. Go to Main Menu\n\s\sInput: "
      user_input = gets.chomp
      case user_input
      when "1"
        puts "\nThis genre's top 5 albums are: "
        # print top 5 albums from chosen genre
        Genre.top5_albums(genre_id)
        second_loop_active = false
      when "2"
        puts "\nThis artist's top 5 artists are: "
        # print top 5 artists from chosen genre
        Genre.top5_artists(genre_id)
        second_loop_active = false
      when "3"
        Screen.clear
        second_loop_active = false
      else
        self.invalid_input
      end
    end
  end
  # End of class definition
end
