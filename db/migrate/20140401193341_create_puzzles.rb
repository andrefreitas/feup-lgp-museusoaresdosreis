class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :imagem
      t.references :aplicacao, index: true

      t.timestamps
    end
  end
end
