class AddHashToImages < ActiveRecord::Migration
  def change
    add_column :images, :hashcode, :string
  end
end
