class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :atv_type
      t.integer :city_mpg
      t.string :co2
      t.string :combined_mpg
      t.string :cylinders
      t.string :liters
      t.string :drive
      t.string :fe_score
      t.string :fuel_type
      t.integer :highway_mpg
      t.string :make
      t.string :model
      t.string :transmission
      t.string :year

      t.timestamps null: false
    end
  end
end
