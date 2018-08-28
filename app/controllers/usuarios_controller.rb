class UsuariosController < ApplicationController
  layout 'admin'
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
      link = link+'?in=#{cod}_#{id}'
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
    @id = params['id']
    @cod = params['cod']
  end
end
