class ImportCsv

  @file = File.open("db/albumlist.csv")

  def self.insert_artist_data
    # May need to drop all tables prior to added to DB
    # Shovels what we want to search for in the array
    rows_to_insert = []

    # Parse the CSV file for all Artist object attributes and return array with elements of attributes
    CSV.foreach(@file, :headers => true) do |row|
      row_hash = row.to_hash
      output_hash = {name: row_hash["Artist"]}
      rows_to_insert << output_hash
    end
    # Delete Artist elements with the same name
    rows_to_insert.uniq! {|element| element[:name]}

    # Create Artist instance for each elements in row_to_insert and add it to database
    Artist.import(rows_to_insert)
  end

  def self.insert_genre_data
    # May need to drop all tables prior to added to DB
    rows_to_insert = []

    CSV.foreach(@file, :headers => true) do |row|
      row_hash = row.to_hash
      #for some rows that have multiple genres, separate into array elements
      separate_genres = row_hash["Genre"].split(", ")
      separate_genres.each do |element|
        output_hash = {name: element}
        rows_to_insert << output_hash
      end
    end
    rows_to_insert.uniq! {|element| element[:name]}

    Genre.import(rows_to_insert)
  end

  def self.insert_album_data
    # May need to drop all tables prior to added to DB
    rows_to_insert = []

    CSV.foreach(@file, :headers => true) do |row|
      row_hash = row.to_hash
      output_hash = {name: row_hash["Album"], year: row_hash["Year"], artist_id: Artist.find_by(name: row_hash["Artist"]).id}
      rows_to_insert << output_hash
    end

    Album.import(rows_to_insert)
  end

  def self.insert_albumgenre_data
    rows_to_insert = []

    CSV.foreach(@file, :headers => true) do |row|
      row_hash = row.to_hash
      separate_genres = row_hash["Genre"].split(", ")
      separate_genres.each do |element|
        output_hash = {album_id: Album.find_by(name: row_hash["Album"]).id, genre_id: Genre.find_by(name: element).id }
        rows_to_insert << output_hash
      end
    end

    AlbumGenre.import(rows_to_insert)
  end

end
