json.extract! curso, :id, :nombre, :descripcion, :imagen, :incluye, :enfocado_a, :requisitos, :tiempo_estimado, :certificable, :estado, :created_at, :updated_at
json.url curso_url(curso, format: :json)
