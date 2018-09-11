class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_action :sessionActive
  layout 'admin'
  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
    stn = "select usuarios.id, nombre, apellido, correo from usuarios "
    stn += "inner join data_usuarios on data_usuarios.usuarios_id=usuarios.id where "
    stn += "creado_por = #{getAdminId} and validado = #{VALIDADO} and estado = #{ACTIVO} and tipo = #{PROF} "
    #@profs = ActiveRecord::Base.connection.execute(stn)
    @profesores = Usuario.find_by_sql([stn])
    @areas = Area.all();
  end

  # GET /cursos/1/edit
  def edit
    stn = "select usuarios.id, nombre, apellido, correo from usuarios "
    stn += "inner join data_usuarios on data_usuarios.usuarios_id=usuarios.id where "
    stn += "creado_por = #{getAdminId} and validado = #{VALIDADO} and estado = #{ACTIVO} and tipo = #{PROF} "
    #@profs = ActiveRecord::Base.connection.execute(stn)
    @profesores = Usuario.find_by_sql([stn])
    @areas = Area.all();
    @act_prof = CursosHasProf.find_by(cursos_id: @curso.id)
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new
    @curso.universidad_id = getAdminId
    @curso.estado = ACTIVO
    @curso.areas_id = params['curso']['areas_id']
    @curso.nombre = params['curso']['nombre']
    @curso.descripcion = params['curso']['descripcion']
    @curso.imagen = params['curso']['imagen']
    @curso.incluye = params['curso']['incluye']
    @curso.enfocado_a = params['curso']['enfocado_a']
    @curso.requisitos = params['curso']['requisitos']
    @curso.tiempo_estimado = params['curso']['tiempo_estimado']
    @curso.certificable = params['curso']['certificable']
    respond_to do |format|
      if @curso.save
        if params['curso']['certificable'] == '1'
          cursoHasProf = CursosHasProf.new
          cursoHasProf.cursos_id = @curso.id
          cursoHasProf.profesor_id = params['prof']
          cursoHasProf.save
        end

        format.html { redirect_to @curso, notice: 'El curso fue creado.' }
        format.json { render :show, status: :created, location: @curso }
      else
        stn = "select usuarios.id, nombre, apellido, correo from usuarios "
        stn += "inner join data_usuarios on data_usuarios.usuarios_id=usuarios.id where "
        stn += "creado_por = #{getAdminId} and validado = #{VALIDADO} and estado = #{ACTIVO} and tipo = #{PROF} "
        #@profs = ActiveRecord::Base.connection.execute(stn)
        @profesores = Usuario.find_by_sql([stn])
        @areas = Area.all();
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      @curso.nombre = params['curso']['nombre']
      @curso.descripcion = params['curso']['descripcion']
      @curso.incluye = params['curso']['incluye']
      @curso.enfocado_a = params['curso']['enfocado_a']
      @curso.requisitos = params['curso']['requisitos']
      @curso.tiempo_estimado = params['curso']['tiempo_estimado']
      @curso.certificable = params['curso']['certificable']
      @curso.areas_id = params['curso']['areas_id']
      unless params['curso']['imagen'].blank?
        @curso.remove_imagen!
      end
      if @curso.save
        unless params['curso']['imagen'].blank?
          cursoModel = Curso.find(@curso.id)
          cursoModel.imagen = params['curso']['imagen']
          cursoModel.save!
        end

        CursosHasProf.where(cursos_id: @curso.id).delete_all;
        if params['curso']['certificable'] == '1'
            cursoProf = CursosHasProf.new
            cursoProf.cursos_id = @curso.id
            cursoProf.profesor_id = params['prof']
            cursoProf.save
        end
        format.html { redirect_to @curso, notice: 'El curso fue correctamente actualizado' }
        format.json { render :show, status: :ok, location: @curso }
      else
        stn = "select usuarios.id, nombre, apellido, correo from usuarios "
        stn += "inner join data_usuarios on data_usuarios.usuarios_id=usuarios.id where "
        stn += "creado_por = #{getAdminId} and validado = #{VALIDADO} and estado = #{ACTIVO} and tipo = #{PROF} "
        #@profs = ActiveRecord::Base.connection.execute(stn)
        @profesores = Usuario.find_by_sql([stn])
        @areas = Area.all();
        @act_prof = CursosHasProf.find_by(cursos_id: @curso.id)
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to cursos_url, notice: 'Curso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nombre, :descripcion, :imagen, :incluye, :enfocado_a, :requisitos, :tiempo_estimado, :certificable, :estado)
    end
end
