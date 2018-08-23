class AddCursoRefToModulos < ActiveRecord::Migration[5.2]
  def change
    add_reference :modulos, :cursos, foreign_key: true
  end
end
