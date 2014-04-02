class CreateAdministradors < ActiveRecord::Migration
  def change
    create_table :administradors do |t|
      t.string :nome
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
