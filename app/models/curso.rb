class Curso < ApplicationRecord
  mount_uploader :imagen, ImagenUploader
  validates :nombre, :descripcion, :incluye, :enfocado_a, :requisitos, :tiempo_estimado,
  :estado, :universidad_id, :areas_id, presence: true
  validates :nombre, length:{minimum: 2}
  validates :descripcion, length:{minimum:10, maximum:255}
  validates :incluye, length:{minimum: 2, maximum: 45}
  validates :enfocado_a, length:{minimum: 2, maximum: 45}
  validates :requisitos, length:{minimum: 2, maximum: 45}
  validates :tiempo_estimado, length:{minimum: 2, maximum: 15}

  belongs_to :area, foreign_key: 'areas_id'
  belongs_to :usuario, foreign_key: 'universidad_id'
end
