# frozen_string_literal: true

class AddFirstNameToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :first_name, :string
  end
end
