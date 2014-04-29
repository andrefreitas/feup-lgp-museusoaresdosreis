class AddImageToAdministrator < ActiveRecord::Migration
  def change
    add_column :administrators, :image, :string
  end
end
