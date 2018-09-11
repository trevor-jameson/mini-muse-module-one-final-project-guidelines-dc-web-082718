class ImportCsv

  def self.insert_artist_data
    # May need to drop all tables prior to added to DB
    file = File.open("db/albumlist.csv")
    fields_to_insert =  %w{ Number Artist }
    rows_to_insert = []
    
    CSV.foreach(file, :headers => true) do |row|
      row_hash = row.to_hash
      output_hash = {}
      output_hash[:id] = row_hash["Number"]
      output_hash[:name] = row_hash["Artist"]

      rows_to_insert << output_hash
      rows_to_insert.uniq! {|element| element[:name]}
    end

    Artist.import(rows_to_insert)
  end

  def self.insert_genre_data
    # May need to drop all tables prior to added to DB
    file = File.open("db/albumlist.csv")
    fields_to_insert =  %w{ Number Genre }
    rows_to_insert = []

    CSV.foreach(file, :headers => true) do |row|
      row_hash = row.to_hash

      output_hash = {}
      output_hash[:id] = row_hash["Number"]
      output_hash[:name] = row_hash["Genre"]

      rows_to_insert << output_hash
      rows_to_insert.uniq! {|element| element[:name]}
    end

    Genre.import(rows_to_insert)
  end



end
