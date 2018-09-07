class LoginController < ApplicationController
  layout 'login'
  before_action :loginSessionActive, only: [:index]

  def index
    @opt = params['opt']
    @alert = params['alert']
    @correo = params['correo']
  end

  def ingreso
    correo = params[:correo]
    password = params[:password]
    usuarioModel = Usuario.new
    data = usuarioModel.valida_usuario(correo, password)
    if data[0] == true
      reset_session
      usuarioData = DataUsuario.find_by(usuarios_id: data[1][:id])

      if usuarioData.blank?
        session[:logo] = 'https://image.flaticon.com/icons/svg/84/84842.svg'
        session[:apellido] = ''
      else
        session[:logo] = usuarioData.foto.url
        session[:apellido] = usuarioData.apellido
      end
      session[:adm_id] = data[1][:id]
      session[:adm_nombre] = data[1][:nombre]
      session[:tipo] = data[1][:tipo]
      session[:rutas] = rutasUsuario
      redirect_to(:controller => 'adm_panel', :action => 'index')
    else
      redirect_to(:action => 'index', :alert => data[1], :correo => correo)
    end
  end

  def recuperar
    correo = params[:correo]
    usuario = Usuario.find_by(correo: correo)
    dataUsuario = DataUsuario.find_by(usuarios_id: usuario.id)
    unless usuario.blank?
      codrecovery = rand(9999)
      usuario.cod_recovery = codrecovery
      usuario.save
      data = {}
      data['nombre'] = usuario.nombre
      data['apellido'] = dataUsuario.apellido
      data['correo'] = correo
      link = url_actual('login/nuevapsw')
      cod = enc_cod(usuario.cod_recovery)
      id = enc_id(usuario.id)
      link = link+"?in=#{cod}_#{id}"
      data['link'] = link
      UsuarioMailer.recuperar(data).deliver_now
      redirect_to(:action => 'index', :alert => "Se envió un correo para que recupere su cuenta", :correo => correo, :opt => 1)
    else
        redirect_to(:action => 'index', :alert => "No existe usuario con ese correo electrónico", :correo => correo, :opt => 1)
    end
  end
  def salir
    reset_session
    session[:adm_id] = nil
    session[:adm_nombre] = nil
    session[:tipo] = nil
    redirect_to({:action => 'index', :alert => "Sesión finalizada, vuelve pronto"})
  end
  #Nueva psw
  def nuevapsw
    @valin = params['in']
    @alert = params['alert']
    valor = @valin.split("_")
    cod = desencriptar(valor[0].to_i)
    id = desencriptar(valor[1].to_i)
    data = Usuario.find_by(cod_recovery: cod, id: id)
    if data.blank?
      redirect_to({:action=>"index", :controller=>"perfil"})
    else

    end
  end
  def cambio
    psw = params['psw']
    valida = params['valida']
    ingreso = params['in']
    iguales = psw <=> valida

    if iguales == 0
      valor = ingreso.split("_")
      cod = desencriptar(valor[0].to_i)
      id = desencriptar(valor[1].to_i)
      usuario = Usuario.find_by(cod_recovery: cod, id: id)
      if usuario.blank?
        redirect_to({:action=>"index", :controller=>"perfil"})
      else
        usuario.psw = encriptaTexto(psw)
        usuario.save
        redirect_to({:action=>"index", :controller=>"login", :alert => "Ingrese con su nueva contraseña"})
      end
    else
      redirect_to({:action => 'nuevapsw', :alert => "Las contraseñas no coinciden", :in => ingreso})
    end
  end
end
