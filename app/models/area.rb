class Area < ApplicationRecord
  validates :nombre, length:{minimum: 2}
  validates :descripcion, length:{minimum:10, maximum:500}
  validates :nombre, :descripcion, presence: true

  has_many :cursos
end
