class RecursoAdicionalsController < ApplicationController
  before_action :set_recurso_adicional, only: [:show, :edit, :update, :destroy]

  # GET /recurso_adicionals
  # GET /recurso_adicionals.json
  def index
    @recurso_adicionals = RecursoAdicional.all
  end

  # GET /recurso_adicionals/1
  # GET /recurso_adicionals/1.json
  def show
  end

  # GET /recurso_adicionals/new
  def new
    @recurso_adicional = RecursoAdicional.new
  end

  # GET /recurso_adicionals/1/edit
  def edit
  end

  # POST /recurso_adicionals
  # POST /recurso_adicionals.json
  def create
    @recurso_adicional = RecursoAdicional.new(recurso_adicional_params)

    respond_to do |format|
      if @recurso_adicional.save
        format.html { redirect_to @recurso_adicional, notice: 'Recurso adicional was successfully created.' }
        format.json { render :show, status: :created, location: @recurso_adicional }
      else
        format.html { render :new }
        format.json { render json: @recurso_adicional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurso_adicionals/1
  # PATCH/PUT /recurso_adicionals/1.json
  def update
    respond_to do |format|
      if @recurso_adicional.update(recurso_adicional_params)
        format.html { redirect_to @recurso_adicional, notice: 'Recurso adicional was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurso_adicional }
      else
        format.html { render :edit }
        format.json { render json: @recurso_adicional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurso_adicionals/1
  # DELETE /recurso_adicionals/1.json
  def destroy
    @recurso_adicional.destroy
    respond_to do |format|
      format.html { redirect_to recurso_adicionals_url, notice: 'Recurso adicional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurso_adicional
      @recurso_adicional = RecursoAdicional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurso_adicional_params
      params.require(:recurso_adicional).permit(:titulo)
    end
end
