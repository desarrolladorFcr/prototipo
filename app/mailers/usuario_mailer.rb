class UsuarioMailer < ApplicationMailer
  default from: 'cifuentesrfelipe@gmail.com'

  def valida_usuario(parametros)

    if session[:tipo] == ADM
      @usuario = parametros['nombre']
      @cuerpo = "Bienvenido a PUBLED, ahora su institución educativa podrá compartir el conocimiento con millones de persona."
      @link = url_route('usuarios/conf_universidad')
      cod = enc_cod(parametros['cod'])
      id = enc_id(parametros['id'])
      @link = @link+'?in=#{cod}_#{id}' 
    end

    if session[:tipo] == UNIV

    end
  end
end
