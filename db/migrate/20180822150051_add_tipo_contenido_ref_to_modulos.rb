class AddTipoContenidoRefToModulos < ActiveRecord::Migration[5.2]
  def change
    add_reference :modulos, :tipo_contenidos, foreign_key: true
  end
end
