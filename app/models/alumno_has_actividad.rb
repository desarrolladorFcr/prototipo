class AlumnoHasActividad < ApplicationRecord
  belongs_to :alumnos
  belongs_to :actividad_temas
end
