class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :album_genres
  has_many :genres, through: :album_genres

  def self.get_all_names
    # outputs every single album name
    puts self.pluck(:name)
  end

  def self.top5_artist_from_decade(input_year)
    #select all artist_id in a specific decade
    input_year = input_year.to_a
    artist_id = self.limit(5).where("? < year AND year > ?", input_year[0], input_year[9]).pluck(:artist_id)
  end

end
