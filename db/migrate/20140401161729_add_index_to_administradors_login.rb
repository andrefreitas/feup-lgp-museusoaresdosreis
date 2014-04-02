class AddIndexToAdministradorsLogin < ActiveRecord::Migration
  def change
    add_index :administradors, :login, unique: true
  end
end
