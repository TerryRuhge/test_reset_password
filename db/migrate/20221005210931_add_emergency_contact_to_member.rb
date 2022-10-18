# frozen_string_literal: true

class AddEmergencyContactToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :emergency_full_name, :string
    add_column :members, :emergency_phone_number, :string
  end
end
