class AddIsMaleToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :is_male, :boolean
  end
end
