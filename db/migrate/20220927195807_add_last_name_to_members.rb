# frozen_string_literal: true

class AddLastNameToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :last_name, :string
  end
end
