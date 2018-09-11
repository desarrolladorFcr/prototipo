json.array! @cursos do |val|
  json.id val.id
  json.nombre val.nombre
  json.imagen url_route(val.imagen.url)
end
