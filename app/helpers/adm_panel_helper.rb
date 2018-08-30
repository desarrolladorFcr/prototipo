module AdmPanelHelper
  def img_adm(datamodel, id, img)
    if img.blank? == false
      data = datamodel.find_by(usuarios_id: id)
      data.foto.url
    else
      image_path('no_encontrada.png')
    end
  end

  def estadoNom(estado)
    res = ''
    res = 'Activo' if estado == ACTIVO
    res = 'Inactivo' if estado == INACTIVO
    return res
  end

  def validadoNom(val)
    res = ''
    res = 'Sí' if val == VALIDADO
    res = 'No' if val == SIN_VALIDAR
    return res
  end
end
