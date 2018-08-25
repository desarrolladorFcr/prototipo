class CreateCursosHasProfs < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos_has_profs do |t|
      t.references :cursos, foreign_key: true
      t.timestamps
    end
  end
end
