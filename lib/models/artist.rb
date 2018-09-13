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

  def self.genres_part_of(artist_name)
    artist_id = self.where("name = ?", artist_name).pluck(:id)
    album_ids = Album.where("artist_id = ?", artist_id).pluck(:id)
    genre_ids = album_ids.map do |album_id|
      AlbumGenre.where("album_id = ?", album_id).pluck(:genre_id)
    end.flatten
    genre_names = genre_ids.map do |genre_id|
      Genre.where("id = ?", genre_id).pluck(:name)
    end
    puts genre_names.uniq
  end

end
