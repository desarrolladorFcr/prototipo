class UsuariosController < ApplicationController
  before_action :sessionActive, except: [:conf_universidad, :usuario_data]
  layout 'admin', except: :conf_universidad
  def universidad

  end
  def profesor

  end
  def crea_u
    correo = params['correo']
    nombre = params['nombre']
    apellido = params['apellido']
    data = Usuario.find_by(correo: correo)

    if data.blank?
      usuModel = Usuario.new
      dataUsuModel = DataUsuario.new
      usuModel.nombre = nombre
      usuModel.correo = correo
      #Si el usuario actual es administrador, crea una universidad
      if getTipo == ADM
          usuModel.tipo = UNIV
          alerta = "Usuario creado. Se le ha enviado un correo electrónico a la universidad para que active y complete el registro"
          accion = "universidad"
      end
      #Si el usuario actual es universidad, crea un profesor
      if getTipo == UNIV
        usuModel.tipo = PROF
        alerta = "Usuario creado. Se le ha enviado un correo electrónico al profesor para que active y complete el registro"
        accion = "profesor"
      end
      #
      usuModel.estado = ACTIVO
      usuModel.validado = SIN_VALIDAR
      usuModel.cod_recovery = rand(9999)
      usuModel.psw = encriptaTexto(rand(9999999).to_s)
      usuModel.save
      #Guardar los datos del modelo DataUsuario
      dataUsuModel.usuarios_id = usuModel.id
      dataUsuModel.apellido = apellido
      dataUsuModel.save
      #creación del link de confirmación de usuario
      link = url_actual('usuarios/conf_universidad')
      cod = enc_cod(usuModel.cod_recovery)
      id = enc_id(usuModel.id)
      link = link+"?in=#{cod}_#{id}"
      params['link'] = link

      if getTipo == ADM
          UsuarioMailer.valida_universidad(params).deliver_now
      end

      if getTipo == UNIV
          UsuarioMailer.valida_profesor(params).deliver_now
      end

      flash[:alert] = alerta
      redirect_to({:action => accion})
    else
      flash[:alert] = "El usuario ya existe"
      redirect_to({:action => "universidad"})
    end
  end
  def conf_universidad
    reset_session
    @valin = params['in']
    @alert = params['alert']
    valor = @valin.split("_")
    cod = desencriptar(valor[0].to_i)
    id = desencriptar(valor[1].to_i)
    data = Usuario.find_by(cod_recovery: cod, id: id)
    if data.blank?
      redirect_to({:action=>"index", :controller=>"perfil"})
    else
      if data['validado'] == SIN_VALIDAR
        @nombre = data['nombre']
        session[:id] = id
        session[:email] = data['correo']
        render layout: "login"
      else
        redirect_to({:action => 'index', :controller=>"login"})
      end
    end
  end
  #
  def usuario_data
    psw = params['psw']
    conf = params['confirmar']
    foto = params['foto']
    valin = params['in']
    val = true
    iguales = psw <=> conf

    if iguales == 0
      if foto.blank? == false
        usuario = Usuario.find_by(id: session[:id])
        datausu = DataUsuario.find_by(usuarios_id: session[:id])
        datausu.foto = params['foto']
        datausu.save!
        usuario.psw = encriptaTexto(psw)
        usuario.validado = VALIDADO
        usuario.save
        redirect_to({:action => "index", :controller => 'login', :alert => "Su usuario fue validado. Ingrese con la contraseña que eligió"})
      else
        alert = "Debe agregar un logo"
        redirect_to({:action => "conf_universidad",  :in => valin, :alert => alert})
      end
    else
      alert = "Las contraseñas no coinciden"
      redirect_to({:action => "conf_universidad", :in => valin, :alert => alert})
    end
  end
end
