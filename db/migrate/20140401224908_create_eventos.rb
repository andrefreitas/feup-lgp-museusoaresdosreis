class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.timestamp :data
      t.string :local
      t.boolean :publicado
      t.timestamp :data_criacao
      t.boolean :visivel
      t.references :cronologia, index: true
      t.references :mapa, index: true

      t.timestamps
    end
  end
end
