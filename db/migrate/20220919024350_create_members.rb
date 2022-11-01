# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, id: false do |t|
      t.primary_key :member_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.boolean :is_admin, default: false
      t.boolean :is_supervisor, default: false
      t.numeric :leaderboard_points
      t.boolean :created_password, default: true
      t.string :emergency_full_name
      t.string :emergency_phone_number

      t.timestamps
    end
  end
end
