# frozen_string_literal: true

class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers, id: false do |t|
      t.primary_key :driver_id
      t.integer :member_id
      t.integer :car_id
      t.datetime :check_in_time
      t.string :driver_status

      t.timestamps
    end
  end
end
