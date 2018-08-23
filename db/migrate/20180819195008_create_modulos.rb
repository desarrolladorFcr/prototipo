class CreateModulos < ActiveRecord::Migration[5.2]
  def change
    create_table :modulos do |t|
      t.string :nombre, limit: 45
      t.timestamp :fecha_inicio
      t.timestamp :fecha_fin

      t.timestamps
    end
  end
end
