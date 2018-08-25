# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_25_173853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actividad_temas", force: :cascade do |t|
    t.string "descripcion", limit: 255
    t.bigint "tema_modulos_id"
    t.index ["tema_modulos_id"], name: "index_actividad_temas_on_tema_modulos_id"
  end

  create_table "alumno_has_actividads", force: :cascade do |t|
    t.bigint "alumnos_id"
    t.bigint "actividad_temas_id"
    t.text "solucion"
    t.string "calificacion"
    t.integer "profesor_id"
    t.text "observaciones"
    t.datetime "fecha_solucion"
    t.index ["actividad_temas_id"], name: "index_alumno_has_actividads_on_actividad_temas_id"
    t.index ["alumnos_id"], name: "index_alumno_has_actividads_on_alumnos_id"
  end

  create_table "alumno_has_cursos", force: :cascade do |t|
    t.bigint "alumnos_id"
    t.bigint "cursos_id"
    t.date "fecha_inicio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumnos_id"], name: "index_alumno_has_cursos_on_alumnos_id"
    t.index ["cursos_id"], name: "index_alumno_has_cursos_on_cursos_id"
  end

  create_table "alumnos", force: :cascade do |t|
    t.string "nombre", limit: 45
    t.string "apellidos", limit: 45
    t.string "documento", limit: 45
    t.integer "tipo_documento", limit: 2
    t.string "correo", limit: 100
    t.string "psw", limit: 100
    t.string "telefono", limit: 45
    t.string "cod_recovery", limit: 10
    t.time "nacimiento"
    t.integer "estado", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string "nombre", limit: 45
    t.string "descripcion", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nombre", limit: 255
    t.string "descripcion", limit: 255
    t.string "imagen", limit: 255
    t.string "incluye", limit: 45
    t.string "enfocado_a", limit: 45
    t.string "requisitos", limit: 45
    t.string "tiempo_estimado", limit: 15
    t.integer "certificable", limit: 2
    t.integer "estado", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "universidad_id"
    t.bigint "areas_id"
    t.index ["areas_id"], name: "index_cursos_on_areas_id"
    t.index ["universidad_id"], name: "index_cursos_on_universidad_id"
  end

  create_table "cursos_has_profs", force: :cascade do |t|
    t.bigint "cursos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profesor_id"
    t.index ["cursos_id"], name: "index_cursos_has_profs_on_cursos_id"
    t.index ["profesor_id"], name: "index_cursos_has_profs_on_profesor_id"
  end

  create_table "data_usuarios", force: :cascade do |t|
    t.string "foto", limit: 255
    t.string "apellido", limit: 45
    t.bigint "usuarios_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuarios_id"], name: "index_data_usuarios_on_usuarios_id"
  end

  create_table "modulos", force: :cascade do |t|
    t.string "nombre", limit: 45
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cursos_id"
    t.index ["cursos_id"], name: "index_modulos_on_cursos_id"
  end

  create_table "recurso_adicionals", force: :cascade do |t|
    t.string "titulo", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cuerpo"
    t.integer "tipo_contenido"
    t.bigint "tema_modulos_id"
    t.index ["tema_modulos_id"], name: "index_recurso_adicionals_on_tema_modulos_id"
  end

  create_table "tema_modulos", force: :cascade do |t|
    t.text "tema"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "modulos_id"
    t.integer "tipo_contenido"
    t.index ["modulos_id"], name: "index_tema_modulos_on_modulos_id"
  end

  create_table "tipo_contenidos", force: :cascade do |t|
    t.string "nombre", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.integer "tipo", limit: 2
    t.string "correo", limit: 100
    t.string "psw", limit: 255
    t.integer "estado", limit: 2
    t.integer "cod_recovery"
    t.integer "validado", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "actividad_temas", "tema_modulos", column: "tema_modulos_id"
  add_foreign_key "alumno_has_actividads", "actividad_temas", column: "actividad_temas_id"
  add_foreign_key "alumno_has_actividads", "alumnos", column: "alumnos_id"
  add_foreign_key "alumno_has_cursos", "alumnos", column: "alumnos_id"
  add_foreign_key "alumno_has_cursos", "cursos", column: "cursos_id"
  add_foreign_key "cursos", "areas", column: "areas_id"
  add_foreign_key "cursos", "usuarios", column: "universidad_id"
  add_foreign_key "cursos_has_profs", "cursos", column: "cursos_id"
  add_foreign_key "cursos_has_profs", "usuarios", column: "profesor_id"
  add_foreign_key "data_usuarios", "usuarios", column: "usuarios_id"
  add_foreign_key "modulos", "cursos", column: "cursos_id"
  add_foreign_key "recurso_adicionals", "tema_modulos", column: "tema_modulos_id"
  add_foreign_key "tema_modulos", "modulos", column: "modulos_id"
end
