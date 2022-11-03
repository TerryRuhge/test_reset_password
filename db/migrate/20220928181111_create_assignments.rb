# frozen_string_literal: true

class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments, id: false do |t|
      t.primary_key :assignment_id
      t.integer :request_id
      t.integer :driver_id
      t.string :notes
      t.datetime :pick_up_time
      t.datetime :drop_off_time

      t.timestamps
    end
  end
end
