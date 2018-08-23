class AdmPanelController < ApplicationController
  layout 'admin'
  before_action :sessionActive
  def index

    @titulo = 'Panel'
  end

  def prueba; end

  def cerrar
    reset_session
  end
end
