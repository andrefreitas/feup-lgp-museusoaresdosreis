class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :language
      t.references :application, index: true

      t.timestamps
    end
  end
end
