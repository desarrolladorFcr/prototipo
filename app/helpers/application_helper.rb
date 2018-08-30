#Constates con el tipo de usuario administrador = 1 | universided = 2  | profesor = 3
ADM = 1
UNIV = 2
PROF = 3
#estado de los usuarios
ACTIVO = 1
INACTIVO = 2
#estado validado
VALIDADO = 1
SIN_VALIDAR = 2

module ApplicationHelper
  #formar la url
  def url_route(ruta)
    'http://'+request.host_with_port+"/"+ruta
  end

  #Mensaje de los formularios
  def msj
    val = "<div class='msj'>"
    if flash[:alert]
        val += "<br><br><div style='color:red'>"+flash[:alert]+"</div>"
    end
    val += "</div>"
    return val.html_safe
  end
  
end
