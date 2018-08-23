class TemaModulosController < ApplicationController
  before_action :set_tema_modulo, only: [:show, :edit, :update, :destroy]

  # GET /tema_modulos
  # GET /tema_modulos.json
  def index
    @tema_modulos = TemaModulo.all
  end

  # GET /tema_modulos/1
  # GET /tema_modulos/1.json
  def show
  end

  # GET /tema_modulos/new
  def new
    @tema_modulo = TemaModulo.new
  end

  # GET /tema_modulos/1/edit
  def edit
  end

  # POST /tema_modulos
  # POST /tema_modulos.json
  def create
    @tema_modulo = TemaModulo.new(tema_modulo_params)

    respond_to do |format|
      if @tema_modulo.save
        format.html { redirect_to @tema_modulo, notice: 'Tema modulo was successfully created.' }
        format.json { render :show, status: :created, location: @tema_modulo }
      else
        format.html { render :new }
        format.json { render json: @tema_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tema_modulos/1
  # PATCH/PUT /tema_modulos/1.json
  def update
    respond_to do |format|
      if @tema_modulo.update(tema_modulo_params)
        format.html { redirect_to @tema_modulo, notice: 'Tema modulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tema_modulo }
      else
        format.html { render :edit }
        format.json { render json: @tema_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tema_modulos/1
  # DELETE /tema_modulos/1.json
  def destroy
    @tema_modulo.destroy
    respond_to do |format|
      format.html { redirect_to tema_modulos_url, notice: 'Tema modulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tema_modulo
      @tema_modulo = TemaModulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tema_modulo_params
      params.require(:tema_modulo).permit(:tema)
    end
end
