class AddProfesorRefToCursosHasProfs < ActiveRecord::Migration[5.2]
  def change
    add_reference :cursos_has_profs, :profesor, foreign_key:{to_table: :usuarios}
  end
end
