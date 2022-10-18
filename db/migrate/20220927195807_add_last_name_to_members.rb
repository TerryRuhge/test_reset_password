class AddLastNameToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :last_name, :string
  end
end
