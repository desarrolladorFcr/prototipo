class ApplicationController < ActionController::Base
  # saber si hay sesión activa en el login, si la hay es enviada al adm_panel/login
  def loginSessionActive
    if session[:adm_id].blank? != true
      redirect_to(controller: 'adm_panel', action: 'index')
    end
  end

  # saber si hay sesión activa para restingir acceso
  def sessionActive
    if session[:adm_id].blank?
      redirect_to(controller: 'login', action: 'index')
      #
    end
    #Comprobar si puede acceder a la ruta actual
    path = Rails.application.routes.recognize_path(request.url, method: request.env["REQUEST_METHOD"])
    path_now = path[:controller]+'/'+path[:action]
    usuRutas = rutasUsuario
    unless usuRutas.blank?
      unless path_now.in?(usuRutas)
        redirect_to(controller: 'adm_panel', action: 'index')
      end
    end
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
  #rutas del usuario
  def rutasUsuario
    res = Array.new
    if getTipo == ADM
      res = adm_acc
    end
    if getTipo == UNIV
      res = univ_acc
    end
    if getTipo == PROF
      res =  prof_acc
    end
    return res
  end

  #Lugar permitidos para super administrador
  def adm_acc
    ['adm_panel/index', 'usuarios/universidad', 'usuarios/crea_usuario', 'areas/index',
    'areas/create', 'areas/new', 'areas/edit', 'areas/show', 'areas/update', 'areas/destroy']
  end
  #Lugares permitidos para Universidad
  def univ_acc
    ['adm_panel/index', 'usuarios/profesor', 'usuarios/crea_usuario', 'cursos/index', 'cursos/create',
       'cursos/new', 'cursos/edit', 'cursos/show', 'cursos/update', 'cursos/destroy']
  end
  #Lugares permitidos para Profesor
  def prof_acc
    ['adm_panel/index']
  end
end
