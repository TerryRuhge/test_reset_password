class ChangeUpdatetimeToBeTimedateInSigns < ActiveRecord::Migration[6.1]
  def change
    change_column :signs, :updatetime, :string
  end
end
