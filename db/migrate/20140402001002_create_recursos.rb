class CreateRecursos < ActiveRecord::Migration
  def change
    create_table :recursos do |t|
      t.integer :linguagem
      t.string :filename
      t.string :conteudo
      t.integer :duracao
      t.references :evento, index: true
      t.string :type

      t.timestamps
    end
  end
end
