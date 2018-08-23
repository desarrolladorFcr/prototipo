class AddUniversidadRefToCursos < ActiveRecord::Migration[5.2]
  def change
    add_reference :cursos, :universidad, foreign_key:{to_table: :usuarios}
  end
end
