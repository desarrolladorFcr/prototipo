class AddTemaModuloRefToActividadTemas < ActiveRecord::Migration[5.2]
  def change
    add_reference :actividad_temas, :tema_modulos, foreign_key: true
  end
end
