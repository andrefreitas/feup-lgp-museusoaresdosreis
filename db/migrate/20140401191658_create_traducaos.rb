class CreateTraducaos < ActiveRecord::Migration
  def change
    create_table :traducaos do |t|
      t.string :lingua
      t.references :aplicacao, index: true

      t.timestamps
    end
  end
end
