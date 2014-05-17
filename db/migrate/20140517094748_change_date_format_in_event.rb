class ChangeDateFormatInEvent < ActiveRecord::Migration
  def change
    change_column :events, :date, :integer
  end
end
