class AddModuloRefToTemaModulos < ActiveRecord::Migration[5.2]
  def change
    add_reference :tema_modulos, :modulos, foreign_key: true
  end
end
