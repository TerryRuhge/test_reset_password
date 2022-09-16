class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.numeric :request_id
      t.numeric :rider_id
      t.datetime :date
      t.string :pick_up_loc
      t.string :drop_off_loc
      t.numeric :num_passengers
      t.string :attire
      t.string :additional_info

      t.timestamps
    end
  end
end
