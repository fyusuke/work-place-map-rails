require 'csv'

# rake import:places
namespace :import do
  desc "Import places from csv"

  task places: :environment do
    path = File.join Rails.root, "db/csv/place_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          category: row["category"],
          address: row["address"],
          group: row["group"],
          latitude: row["latitude"].to_f,
          longitude: row["longitude"].to_f,
          opening_hours: row["opening_hours"],
      }
    end
    puts "start to create places data"
    begin
      Place.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end