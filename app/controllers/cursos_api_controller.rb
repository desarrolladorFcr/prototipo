class CursosApiController < ApplicationController

  def index
    @cursos = Curso.all
    #JSON.parse(@cursos)
  end
end
