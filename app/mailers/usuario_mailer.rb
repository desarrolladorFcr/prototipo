class UsuarioMailer < ApplicationMailer
  default from: 'celartur69@gmail.com'

  def valida_universidad(parametros)
    @usuario = parametros['nombre']
    @cuerpo = 'Bienvenido a PUBLED, ahora su institución educativa podrá compartir el conocimiento con millones de persona.'
    @link = parametros['link']

    mail(to: parametros['correo'], subject: 'Bienvenido a PUBLED', template_path: 'usuario_mailer',
         template_name: 'valida_usuario')
  end

  def valida_profesor(parametros)
    @usuario = parametros['nombre']+" "+parametros['apellido']
    @cuerpo = 'Bienvenido a PUBLED, ahora  podrá compartir el conocimiento con millones de persona.'
    @link = parametros['link']

    mail(to: parametros['correo'], subject: 'Bienvenido a PUBLED', template_path: 'usuario_mailer',
         template_name: 'valida_usuario')
  end

  def recuperar(parametros)
    @usuario = parametros['nombre']+" "+parametros['apellido'].to_s
    @cuerpo = 'Bienvenido a PUBLED, para recuperar su contraseña siga el siguiente enlace '
    @recuperar = 1
    @link = parametros['link']

    mail(to: parametros['correo'], subject: 'Bienvenido a PUBLED', template_path: 'usuario_mailer',
         template_name: 'valida_usuario')
  end
end
