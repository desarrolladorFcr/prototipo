class ApplicationController < ActionController::Base
  #saber si hay sesión activa en el login
  def loginSessionActive
    if session[:adm_id].blank? != true
      redirect_to(controller: 'adm_panel', action: 'index')
    end
  end
  # saber si hay sesión activa para restingir acceso
  def sessionActive
    if session[:adm_id].blank?
      redirect_to(controller: 'login', action: 'index')
    end
  end
end
