class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :key
      t.string :content
      t.references :translation, index: true

      t.timestamps
    end
  end
end
