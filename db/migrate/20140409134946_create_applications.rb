class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :language
      t.integer :text_size

      t.timestamps
    end
  end
end
