class CreateChronologies < ActiveRecord::Migration
  def change
    create_table :chronologies do |t|
      t.boolean :auto_mode
      t.references :application, index: true

      t.timestamps
    end
  end
end
