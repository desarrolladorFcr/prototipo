class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :nombre, limit: 255
      t.string :descripcion, limit: 255
      t.string :imagen, limit: 255
      t.string :incluye, limit: 45
      t.string :enfocado_a, limit: 45
      t.string :requisitos, limit: 45
      t.string :tiempo_estimado, limit: 15
      t.integer :certificable, limit: 1
      t.integer :estado, limit: 1
      #t.belongs_to :areas, foreign_key: true
      #t.belongs_to :usuarios, foreign_key: :universidad_id
      t.timestamps
    end
  end
end
