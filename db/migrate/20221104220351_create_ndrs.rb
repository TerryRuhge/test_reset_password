class CreateNdrs < ActiveRecord::Migration[6.1]
  def change
    create_table :ndrs do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_active
      t.integer :ndr_id

      t.timestamps
    end
  end
end
