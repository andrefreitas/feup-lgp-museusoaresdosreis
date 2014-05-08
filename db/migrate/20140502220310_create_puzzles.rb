class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :name
      t.references :image, index: true

      t.timestamps
    end
  end
end
