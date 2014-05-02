class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.timestamp :date
      t.boolean :published
      t.boolean :public
      t.references :chronology, index: true
      t.references :map, index: true

      t.timestamps
    end
  end
end
