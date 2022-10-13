class AddPhoneToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :phone, :string
  end
end
