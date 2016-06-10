require 'csv'

namespace :data do
  task :import_data => :environment do

    cars ="#{Rails.root}/vehicles.csv"


    CSV.foreach(cars, :headers => true) do |row|

      data = row.to_hash
      Car.create!(
      atv_type: data["atvtype"],
      city_mpg: data['city08'],
      co2:      data["co2"],
      combined_mpg: data["comb08"],
      cylinders: data["cylinders"],
      liters: data["displ"],
      drive: data["drive"],
      fe_score: data["feScore"],
      fuel_type: data["fuelCost08"],
      highway_mpg: data["highway08"],
      make: data["make"],
      model: data["model"],
      transmission: data["trany"],
      year: data["year"]

      )
      puts "created car make: #{data['make']}, model: #{data['model']}"
    end
  end
end
