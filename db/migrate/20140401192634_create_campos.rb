class CreateCampos < ActiveRecord::Migration
  def change
    create_table :campos do |t|
      t.string :chave
      t.string :conteudo
      t.references :traducao, index: true

      t.timestamps
    end
  end
end
