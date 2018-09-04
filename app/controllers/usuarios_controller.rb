class UsuariosController < ApplicationController
  before_action :sessionActive, except: [:conf_universidad, :usuario_data]
  layout 'admin', except: :conf_universidad
  def universidad
    sentencia = "select usuarios.id, nombre, correo, estado, validado, usuarios.created_at, foto "
    sentencia += "from usuarios inner join data_usuarios on data_usuarios.usuarios_id = usuarios.id "
    sentencia += "where usuarios.tipo= #{UNIV} "
    @universidades = Usuario.find_by_sql([sentencia])
    @dataUsuario = DataUsuario
  end
  def profesor
    sentencia = "select usuarios.id, nombre, correo, estado, validado, usuarios.created_at, foto, apellido "
    sentencia += "from usuarios inner join data_usuarios on data_usuarios.usuarios_id = usuarios.id "
    sentencia += "where usuarios.tipo= #{PROF} and usuarios.creado_por=#{getAdminId}"
    @profesores = Usuario.find_by_sql([sentencia])
    @dataUsuario = DataUsuario
  end
  def crea_u
    render 'prueba'
  end
  #Muestra la vista para confirmar universidad y profesor
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
  #cambia la validación del usuario y agrega mayor información
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
