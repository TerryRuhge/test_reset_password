class CreateSigns < ActiveRecord::Migration[6.1]
  def change
    create_table :signs do |t|
      t.time :updatetime
      t.string :status

      t.timestamps
    end
  end
end
