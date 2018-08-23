class AddTemaModulosRefToRecursoAdicionals < ActiveRecord::Migration[5.2]
  def change
    add_reference :recurso_adicionals, :tema_modulos, foreign_key: true
  end
end
