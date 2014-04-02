class CreateCronologia < ActiveRecord::Migration
  def change
    create_table :cronologia do |t|
      t.boolean :modo_automatico

      t.timestamps
    end
  end
end
