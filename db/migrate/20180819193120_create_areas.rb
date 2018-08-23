class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :nombre, limit: 45
      t.string :descripcion, limit: 255
      t.timestamps
    end
  end
end
