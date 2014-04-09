class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.references :application, index: true

      t.timestamps
    end
  end
end
