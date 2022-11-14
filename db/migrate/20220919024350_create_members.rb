# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, id: false do |t|
      t.primary_key :member_id
      #Personal Information
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      #Member Functions
      t.boolean :is_admin, default: false
      t.boolean :is_supervisor, default: false
      t.numeric :leaderboard_points, default: 0
      t.boolean :created_password, default: true
      #Emergency Contact
      t.string :emergency_1_full_name
      t.string :emergency_1_phone_number
      t.string :emergency_2_full_name, optional: true
      t.string :emergency_2_phone_number, optional: true
      #Driver Required Information
      t.string :drivers_license_number
      t.string :state_issue_lciense
      t.boolean :current_license, default: false
      t.date :date_of_birth
      #Parent Information
      t.string :parent_number, optional: true
      t.string :parent_street_address, optional: true
      t.string :parent_city, optional: true
      t.string :parent_state, optional: true
      t.string :parent_zip, optional: true
      #Miscellaneous
      t.string :tshirt_size, default: "Medium"
      t.boolean :has_insurance, default: false
      t.string :allergies, optional: true
      t.string :special_dietary_needs, optional: true
      t.numeric :semesters_as_member, default: 0
      t.string :college_major, optional: true
      
      t.timestamps
    end
  end
end
