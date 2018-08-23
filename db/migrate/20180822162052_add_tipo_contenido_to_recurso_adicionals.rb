class AddTipoContenidoToRecursoAdicionals < ActiveRecord::Migration[5.2]
  def change
    add_column :recurso_adicionals, :tipo_contenido, :integer
  end
end
