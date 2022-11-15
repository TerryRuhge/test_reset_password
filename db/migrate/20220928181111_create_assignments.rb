# frozen_string_literal: true

class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments, id: false do |t|
      t.primary_key :assignment_id
      t.integer :member_id
      t.integer :request_id
      t.integer :car_id
      t.datetime :drop_off_time

      t.timestamps
    end
  end
end
