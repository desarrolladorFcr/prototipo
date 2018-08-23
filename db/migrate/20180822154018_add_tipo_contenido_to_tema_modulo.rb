class AddTipoContenidoToTemaModulo < ActiveRecord::Migration[5.2]
  def change
    add_column :tema_modulos, :tipo_contenido, :integer
  end
end
