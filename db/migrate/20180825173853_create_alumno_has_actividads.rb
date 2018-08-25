class CreateAlumnoHasActividads < ActiveRecord::Migration[5.2]
  def change
    create_table :alumno_has_actividads do |t|
      t.references :alumnos, foreign_key: true
      t.references :actividad_temas, foreign_key: true
      t.text :solucion
      t.string :calificacion
      t.integer :profesor_id, limit: 4
      t.text :observaciones
      t.datetime :fecha_solucion
    end
  end
end
