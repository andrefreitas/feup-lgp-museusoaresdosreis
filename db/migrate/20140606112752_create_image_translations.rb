class CreateImageTranslations < ActiveRecord::Migration
  def change
    create_table :image_translations do |t|
      t.string :path
      t.text :caption
      t.string :title
      t.references :event_translation, index: true

      t.timestamps
    end
  end
end
