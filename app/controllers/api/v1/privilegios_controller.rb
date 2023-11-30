class Api::V1::PrivilegiosController < ApplicationController
  before_action :set_privilegio, only: %i[ show update destroy ]

  # GET /privilegios
  def index
    @privilegios = Privilegio.all

    render json: @privilegios
  end

  # GET /privilegios/1
  def show
    render json: @privilegio
  end

  # GET /privilegios/usuarios
  def usuarios
    privilegio = Privilegio.find(params[:privilegio_id])
    usuario = privilegio.usuario
    render json: usuario
  end

  # POST /privilegios
  def create
    @privilegio = Privilegio.new(privilegio_params)

    if @privilegio.save
      render json: @privilegio, status: :created
    else
      render json: @privilegio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /privilegios/1
  def update
    if @privilegio.update(privilegio_params)
      render json: @privilegio
    else
      render json: @privilegio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /privilegios/1
  def destroy
    @privilegio.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilegio
      @privilegio = Privilegio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def privilegio_params
      params.require(:privilegio).permit(:nombre)
    end
end
