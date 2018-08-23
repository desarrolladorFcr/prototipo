class Usuario < ApplicationRecord
  # Encripta texto en md5
  def crypttext(text)
    md5 = Digest::MD5.new
    val = md5.hexdigest(text)
    val
  end
  # obtiene la inf del usuario por el correo-e
  def valida_usuario(correo, clave)
    data = Usuario.find_by(correo: correo, estado: ACTIVO, validado: VALIDADO)
    if data.blank?
      data1 = Usuario.find_by(correo: correo, estado: ACTIVO)
      if data1.blank? != true
        return [false, 'El usuario no ha sido validado, hágalo desde el mensaje que llego a su correo electrónico']
      else
        return [false, 'No existe usuario con ese correo electrónico']
      end
    else
      psw = data[:psw]
      clave_ing = crypttext(clave)
      res = psw <=> clave_ing
      if res == 0
        return [true, data]
      else
        return [false, 'contraseña incorrecta']
      end
    end
  end
  # fin de la función
end
