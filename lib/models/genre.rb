class Genre < ActiveRecord::Base
  has_many :album_genres
  has_many :albums, through: :album_genres
  has_many :artists, through: :albums #should this include album_genre?

  def self.get_all_names
    # outputs every single genre name
    puts self.pluck(:name)
  end

  def self.top5_albums(genre_name)
    # get genre_id
    genre_id = self.where("name = ?", genre_name).pluck(:id)
    # get the top 5 album_id of this genre
    top5_album_id = AlbumGenre.limit(5).where("genre_id = ?", genre_id).pluck(:album_id)
    #get the album names
    top5_album_id.each do |album_id|
      puts Album.where("id = ?", album_id).pluck(:name)
    end
  end

  def self.top5_artists(genre_name)
    # get genre_id
    genre_id = self.where("name = ?", genre_name).pluck(:id)
    # get the top 5 album_id of this genre
    top5_album_id = AlbumGenre.limit(5).where("genre_id = ?", genre_id).pluck(:album_id)
    #get the artist_id
    top5_artist_id = top5_album_id.map do |album_id|
      Album.where("id = ?", album_id).pluck(:artist_id)
    end.flatten
    #get the artists from artist_id
    top5_artist_id.each do |artist_id|
      puts Artist.where("id = ?", artist_id).pluck(:name)
    end
  end


end
