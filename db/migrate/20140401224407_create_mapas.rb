class CreateMapas < ActiveRecord::Migration
  def change
    create_table :mapas do |t|
      t.references :aplicacao, index: true

      t.timestamps
    end
  end
end
