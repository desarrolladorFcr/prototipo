class CreateRecursoAdicionals < ActiveRecord::Migration[5.2]
  def change
    create_table :recurso_adicionals do |t|
      t.string :titulo, limit: 255
      t.timestamps
    end
  end
end
