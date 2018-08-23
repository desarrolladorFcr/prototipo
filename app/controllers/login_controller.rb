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
      session[:adm_id] = data[1][:id]
      session[:adm_nombre] = data[1][:nombre]
      session[:tipo] = data[1][:tipo]
      redirect_to(:controller => 'adm_panel', :action => 'index')
    else
      redirect_to(:action => 'index', :alert => data[1], :correo => correo)
    end
  end

  def recuperar
    correo = params[:correo]
  end
  def salir
    reset_session
    session[:adm_id] = nil
    session[:adm_nombre] = nil
    session[:tipo] = nil
    redirect_to({:action => 'index', :alert => "Sesión finalizada, vuelve pronto"})
  end
end
