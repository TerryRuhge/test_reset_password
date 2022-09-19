class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, id: false do |t|
      t.primary_key :member_id
      t.integer :driver_id
      t.string :username
      t.string :password
      t.numeric :leaderboard_points
      t.integer :emergency_contact_id

      t.timestamps
    end
  end
end
