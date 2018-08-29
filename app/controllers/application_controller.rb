class ApplicationController < ActionController::Base
  # saber si hay sesión activa en el login, si la hay es enviada al adm_panel/login
  def loginSessionActive
    if session[:adm_id].blank? != true
      redirect_to(controller: 'adm_panel', action: 'index')
    end
  end

  # saber si hay sesión activa para restingir acceso
  def sessionActive
    redirect_to(controller: 'login', action: 'index') if session[:adm_id].blank?
  end

  # devuelve el ID del administrador
  def getAdminId
    session[:adm_id]
  end

  # Devuelve el tipo de administrador
  def getTipo
    session[:tipo]
  end

  # encriptar el cod_recovery
  def enc_cod(cod)
    num * cod
  end

  # encriptar #
  def enc_id(id)
    num * id
  end
  #Desencriptar cod o id
  def desencriptar(inf)
    inf/num
  end
  # formar la url
  def url_actual(ruta)
    'http://' + request.host_with_port + '/' + ruta
  end

  # encriptar texto
  def encriptaTexto(text)
    md5 = Digest::MD5.new
    val = md5.hexdigest(text)
    val
  end

  # clave
  def num
    num = 759_842_136_754
  end
end
