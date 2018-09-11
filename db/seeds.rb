class ImportCsv < ActiveRecord::Base

  def self.insert_data
    # May need to drop all tables prior to added to DB
    file = File.open("db/albumlist.csv")
    CSV.foreach(file, :headers => true) do |row|
      # Instantiates class objects from row data
      new_artist = Artist.create(:name => row["Artist"])
      new_album = Album.create(:name => row["Album"], :year => row["Year"])
      new_genre = Genre.create(:name => row["Genre"])

      # Insert association data from newly instatiated objects
      new_album.artist_id = new_artist.id
      new_album.genre_id = new_genre.id
      new_genre.album_id = new_album.id
      new_join = AlbumGenre.create()
      binding.pry
      # test table is returning ID

    end
  end
end
