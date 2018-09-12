class Artist < ActiveRecord::Base
  has_many :albums
  has_many :genres, through: :albums

  def self.get_all_names
    # outputs every single artist name
    puts self.pluck(:name)
  end

  def self.top3_popular_album(artist_name)
    # get the artist_id of the artist
    artist_id = self.where("name = ?", artist_name).pluck(:id)
    # get the top 3 albums of this artist
    puts Album.limit(3).where("artist_id = ?", artist_id).pluck(:name)
  end

  def self.most_popular_album(artist_name)
    artist_id = self.where("name = ?", artist_name).pluck(:id)
    puts Album.limit(1).where("artist_id = ?", artist_id).pluck(:name)
  end


end
