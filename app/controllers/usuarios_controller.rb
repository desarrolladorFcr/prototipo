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
      usuModel.save
      params['id'] = usuModel.id
      params['cod'] = usuModel.cod_recovery
      UsuarioMailer.valida_usuario(params)
      flash[:alert] = "Usuario creado. Se le ha enviado un correo electrónico a la universidad para que active y complete el registro"
    else
      flash[:alert] = "El usuario ya existe"
      redirect_to({:action => "universidad"})
    end
  end
  def conf_universidad

  end
end
