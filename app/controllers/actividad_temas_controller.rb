class ActividadTemasController < ApplicationController
  before_action :set_actividad_tema, only: [:show, :edit, :update, :destroy]

  # GET /actividad_temas
  # GET /actividad_temas.json
  def index
    @actividad_temas = ActividadTema.all
  end

  # GET /actividad_temas/1
  # GET /actividad_temas/1.json
  def show
  end

  # GET /actividad_temas/new
  def new
    @actividad_tema = ActividadTema.new
  end

  # GET /actividad_temas/1/edit
  def edit
  end

  # POST /actividad_temas
  # POST /actividad_temas.json
  def create
    @actividad_tema = ActividadTema.new(actividad_tema_params)

    respond_to do |format|
      if @actividad_tema.save
        format.html { redirect_to @actividad_tema, notice: 'Actividad tema was successfully created.' }
        format.json { render :show, status: :created, location: @actividad_tema }
      else
        format.html { render :new }
        format.json { render json: @actividad_tema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividad_temas/1
  # PATCH/PUT /actividad_temas/1.json
  def update
    respond_to do |format|
      if @actividad_tema.update(actividad_tema_params)
        format.html { redirect_to @actividad_tema, notice: 'Actividad tema was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad_tema }
      else
        format.html { render :edit }
        format.json { render json: @actividad_tema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividad_temas/1
  # DELETE /actividad_temas/1.json
  def destroy
    @actividad_tema.destroy
    respond_to do |format|
      format.html { redirect_to actividad_temas_url, notice: 'Actividad tema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad_tema
      @actividad_tema = ActividadTema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_tema_params
      params.require(:actividad_tema).permit(:descripcion)
    end
end
