class CreateAlumnoHasCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :alumno_has_cursos do |t|
      t.references :alumnos, foreign_key: true
      t.references :cursos, foreign_key: true
      t.date :fecha_inicio

      t.timestamps
    end
  end
end
