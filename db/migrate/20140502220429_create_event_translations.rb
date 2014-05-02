class CreateEventTranslations < ActiveRecord::Migration
  def change
    create_table :event_translations do |t|
      t.string :lang
      t.string :title
      t.string :content
      t.references :event, index: true

      t.timestamps
    end
  end
end
