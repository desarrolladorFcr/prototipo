class CreateTemaModulos < ActiveRecord::Migration[5.2]
  def change
    create_table :tema_modulos do |t|
      t.text :tema

      t.timestamps
    end
  end
end
