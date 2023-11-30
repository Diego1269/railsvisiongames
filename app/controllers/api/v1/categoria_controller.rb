class Api::V1::CategoriaController < ApplicationController
  before_action :set_categorium, only: %i[ show update destroy ]

  # GET /categoria
  def index
    @categoria = Categorium.all

    render json: @categoria
  end

  # GET /categoria/1
  def show
    render json: @categorium
  end

  # GET /categoria/juegos/1
  def juegos
    categoria = Categoria.find(params[:categoria_id])
    producto = categoria.producto
    render json: producto
  end

  # POST /categoria
  def create
    @categorium = Categorium.new(categorium_params)

    if @categorium.save
      render json: @categorium, status: :created
    else
      render json: @categorium.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categoria/1
  def update
    if @categorium.update(categorium_params)
      render json: @categorium
    else
      render json: @categorium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categoria/1
  def destroy
    @categorium.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categorium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorium_params
      params.require(:categorium).permit(:nombre)
    end
end
