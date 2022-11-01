# frozen_string_literal: true

class CreateWhitelists < ActiveRecord::Migration[6.1]
  def change
    create_table :whitelists, id: false do |t|
      t.primary_key :whitelist_id
      t.string :email

      t.timestamps
    end
  end
end
