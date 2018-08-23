class CreateActividadTemas < ActiveRecord::Migration[5.2]
  def change
    create_table :actividad_temas do |t|
      t.string :descripcion, limit: 255
    end
  end
end
