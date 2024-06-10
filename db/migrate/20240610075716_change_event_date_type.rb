class ChangeEventDateType < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :date, :date
  end
end
