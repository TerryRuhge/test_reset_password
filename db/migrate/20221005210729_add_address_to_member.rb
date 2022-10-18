class AddAddressToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :address, :string
  end
end
