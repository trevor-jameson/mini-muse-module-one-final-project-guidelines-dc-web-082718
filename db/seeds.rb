class ImportCsv < ActiveRecord::Base

  def self.insert_data
    # May need to drop all tables prior to added to DB
    file = File.open("db/albumlist.csv")
    CSV.foreach(file, :headers => true) do |row|
      # Instantiates class objects from row data
      new_artist = Artist.create(:name => row["Artist"])
      new_album = Album.create(:name => row["Album"], :year => row["Year"])
      new_join = AlbumGenre.create()
      new_genre = Genre.create(:name => row["Genre"])
      
      #insert data
      binding.pry
      # test table is returning ID

    end
  end
end
