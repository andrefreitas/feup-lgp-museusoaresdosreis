class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :path
      t.references :event, index: true

      t.timestamps
    end
  end
end
