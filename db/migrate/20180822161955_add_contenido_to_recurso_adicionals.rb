class AddContenidoToRecursoAdicionals < ActiveRecord::Migration[5.2]
  def change
    add_column :recurso_adicionals, :cuerpo, :text
  end
end
