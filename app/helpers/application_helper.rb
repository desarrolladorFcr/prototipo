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
  #devuelve el ID del administrador
  def getAdminId
    session[:adm_id]
  end
  #Mensaje de los formularios
  def msj
    if flash[:alert]
        val = "<br><br><div style='color:red'>"+flash[:alert]+"</div>"
        val.html_safe
    end
  end
  #encriptar el cod_recovery
  def enc_cod(cod)
      759842136754 * cod
  end
  #encriptar #
  def enc_id(id)
    759842136754 * id
  end
end
