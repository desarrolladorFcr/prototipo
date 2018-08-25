class AlumnoHasCurso < ApplicationRecord
  belongs_to :alumnos
  belongs_to :cursos
end
