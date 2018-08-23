class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.integer :tipo, limit: 2
      t.string :correo, limit: 100
      t.string :psw, limit: 255
      t.integer :estado, limit: 2
      t.integer :cod_recovery
      t.integer :validado, limit: 2

      t.timestamps
    end
  end
end
