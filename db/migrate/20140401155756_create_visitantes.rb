class CreateVisitantes < ActiveRecord::Migration
  def change
    create_table :visitantes do |t|

      t.timestamps
    end
  end
end
