class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers, id: false do |t|
      t.primary_key :driver_id
      t.integer :member_id
      t.string :phone_number
      t.string :car_model
      t.datetime :check_in_time
      t.string :driver_status

      t.timestamps
    end
  end
end
