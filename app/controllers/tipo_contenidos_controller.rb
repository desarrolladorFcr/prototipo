class TipoContenidosController < ApplicationController
  before_action :set_tipo_contenido, only: [:show, :edit, :update, :destroy]

  # GET /tipo_contenidos
  # GET /tipo_contenidos.json
  def index
    @tipo_contenidos = TipoContenido.all
  end

  # GET /tipo_contenidos/1
  # GET /tipo_contenidos/1.json
  def show
  end

  # GET /tipo_contenidos/new
  def new
    @tipo_contenido = TipoContenido.new
  end

  # GET /tipo_contenidos/1/edit
  def edit
  end

  # POST /tipo_contenidos
  # POST /tipo_contenidos.json
  def create
    @tipo_contenido = TipoContenido.new(tipo_contenido_params)

    respond_to do |format|
      if @tipo_contenido.save
        format.html { redirect_to @tipo_contenido, notice: 'Tipo contenido was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_contenido }
      else
        format.html { render :new }
        format.json { render json: @tipo_contenido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_contenidos/1
  # PATCH/PUT /tipo_contenidos/1.json
  def update
    respond_to do |format|
      if @tipo_contenido.update(tipo_contenido_params)
        format.html { redirect_to @tipo_contenido, notice: 'Tipo contenido was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_contenido }
      else
        format.html { render :edit }
        format.json { render json: @tipo_contenido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_contenidos/1
  # DELETE /tipo_contenidos/1.json
  def destroy
    @tipo_contenido.destroy
    respond_to do |format|
      format.html { redirect_to tipo_contenidos_url, notice: 'Tipo contenido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_contenido
      @tipo_contenido = TipoContenido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_contenido_params
      params.require(:tipo_contenido).permit(:nombre)
    end
end
