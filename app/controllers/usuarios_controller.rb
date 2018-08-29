class UsuariosController < ApplicationController
  before_action :sessionActive, except: [:conf_universidad, :universidad_data]
  layout 'admin', except: :conf_universidad
  def universidad

  end
  def crea_u
    correo = params['correo']
    nombre = params['nombre']
    data = Usuario.find_by(correo: correo)

    if data.blank?
      usuModel = Usuario.new
      usuModel.nombre = nombre
      usuModel.correo = correo
      usuModel.tipo = UNIV
      usuModel.estado = ACTIVO
      usuModel.validado = SIN_VALIDAR
      usuModel.cod_recovery = rand(9999)
      usuModel.psw = encriptaTexto(rand(9999999).to_s)
      usuModel.save
      link = url_actual('usuarios/conf_universidad')
      cod = enc_cod(usuModel.cod_recovery)
      id = enc_id(usuModel.id)
      link = link+"?in=#{cod}_#{id}"
      params['link'] = link
      UsuarioMailer.valida_universidad(params).deliver_now
      flash[:alert] = "Usuario creado. Se le ha enviado un correo electrónico a la universidad para que active y complete el registro"
      redirect_to({:action => "universidad"})
    else
      flash[:alert] = "El usuario ya existe"
      redirect_to({:action => "universidad"})
    end
  end
  def conf_universidad
    reset_session
    valin = params['in']
    valor = valin.split("_")
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
  def universidad_data

  end
end
