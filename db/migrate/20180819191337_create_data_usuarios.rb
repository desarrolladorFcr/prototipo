class CreateDataUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :data_usuarios do |t|
      t.string :foto, limit: 255
      t.string :apellido, limit: 45
      t.belongs_to :usuarios, index: true, foreign_key: true
      t.timestamps
    end
  end
end
