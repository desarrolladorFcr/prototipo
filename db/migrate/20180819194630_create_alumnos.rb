class CreateAlumnos < ActiveRecord::Migration[5.2]
  def change
    create_table :alumnos do |t|
      t.string :nombre, limit: 45
      t.string :apellidos, limit: 45
      t.string :documento, limit: 45
      t.integer :tipo_documento, limit: 1
      t.string :correo, limit: 100
      t.string :psw, limit: 100
      t.string :telefono, limit: 45
      t.string :cod_recovery, limit: 10
      t.time :nacimiento
      t.integer :estado, limit: 1

      t.timestamps
    end
  end
end
