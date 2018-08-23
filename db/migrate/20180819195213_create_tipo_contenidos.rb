class CreateTipoContenidos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_contenidos do |t|
      t.string :nombre, limit: 16
      t.timestamps
    end
  end
end
