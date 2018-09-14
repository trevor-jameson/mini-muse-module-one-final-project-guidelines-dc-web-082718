class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :album_genres
  has_many :genres, through: :album_genres

  def self.for_long_lists(arr)
    user_input = 0
    arr.each.with_index(1) do |name, index|
      puts "#{index}) #{name}"
      if index % 10 == 0 && user_input != "n"
        puts "\nDo you want to see more? [y/n]"
        user_input = gets.chomp
        puts "\n"
        if user_input == "y"
          next
        elsif user_input == "n"
          return
        else
          Interface.invalid_option
        end
      end
    end
  end

  def self.get_all_names
    # outputs every single album name
    arr = self.pluck(:name)
    self.for_long_lists(arr)

  end

  def self.top5_artist_from_decade(input_years)
    #select top 5 artist_id in a specific decade
    input_years = input_years.to_a
    top5_artist_id = self.limit(10).where(year: input_years[0]..input_years[-1]).pluck(:artist_id)
    arr = top5_artist_id.map do |artist_id|
      Artist.where("id = ?", artist_id).pluck(:name)
    end.flatten
    arr.uniq!
    puts arr[0..4]
    print "Press any key to continue: "
  end

  def self.top5_album_from_decade(input_years)
    #select top 5 artist_id in a specific decade
    input_years = input_years.to_a
    puts self.limit(5).where(year: input_years[0]..input_years[9]).pluck(:name)
    print "Press any key to continue: "
  end

end
