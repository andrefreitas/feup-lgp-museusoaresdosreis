class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :image
      t.references :application, index: true

      t.timestamps
    end
  end
end
