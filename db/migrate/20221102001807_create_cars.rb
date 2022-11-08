class CreateCars < ActiveRecord::Migration[6.1]

  
  def change
    create_table :cars, id: false do |t|
      t.primary_key :car_id
      t.string :make
      t.string :model
      t.string :color
      t.string :plate_number
      t.date :registration_expiry

      t.timestamps
    end
  end
end