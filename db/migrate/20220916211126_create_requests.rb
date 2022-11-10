# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[6.1]
  
  def change
    create_table :requests, id: false do |t|
      t.primary_key :request_id
      t.string :name
      t.string :phone_number
      t.string :request_status
      t.string :pick_up_loc
      t.string :drop_off_loc
      t.integer :num_passengers
      t.string :additional_info
      t.integer :queue_pos

      t.timestamps
    end
  end
end
