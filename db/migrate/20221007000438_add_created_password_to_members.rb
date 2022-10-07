class AddCreatedPasswordToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :created_password, :boolean
  end
end
