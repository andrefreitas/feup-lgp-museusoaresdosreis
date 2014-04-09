class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :date
      t.string :local
      t.boolean :published
      t.timestamp :created_date
      t.boolean :visible
      t.references :chronology, index: true
      t.references :map, index: true

      t.timestamps
    end
  end
end
