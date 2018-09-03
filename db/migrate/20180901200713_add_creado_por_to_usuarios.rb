class AddCreadoPorToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :creado_por, :integer
  end
end
