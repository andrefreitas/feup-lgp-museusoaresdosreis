class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :filename
      t.string :content
      t.integer :language
      t.integer :duration
      t.references :event, index: true
      t.string :type

      t.timestamps
    end
  end
end
