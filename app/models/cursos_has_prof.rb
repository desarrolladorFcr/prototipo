class CursosHasProf < ApplicationRecord
  has_and_belongs_to_many :cursos, foreign_key: 'cursos_id'
  has_and_belongs_to_many :usuarios, foreign_key: 'profesor_id'
end
