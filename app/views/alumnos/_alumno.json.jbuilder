json.extract! alumno, :id, :nombre, :apellidos, :documento, :tipo_documento, :correo, :psw, :telefono, :cod_recovery, :nacimiento, :estado, :created_at, :updated_at
json.url alumno_url(alumno, format: :json)
