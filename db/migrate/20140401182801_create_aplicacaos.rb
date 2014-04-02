class CreateAplicacaos < ActiveRecord::Migration
  def change
    create_table :aplicacaos do |t|
      t.integer :linguagem
      t.integer :tamanho_texto

      t.timestamps
    end
  end
end
