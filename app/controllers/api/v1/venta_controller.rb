class Api::V1::VentaController < ApplicationController
  before_action :set_venta, only: %i[ show update destroy ]

  # GET /venta
  def index
    @venta = Ventum.all

    render json: @venta
  end

  # GET /venta/1
  def show
    render json: @venta
  end

  # POST /venta
  def create
    @venta = Ventum.new(venta_params)

    if @venta.save
      render json: @venta, status: :created
    else
      render json: @venta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venta/1
  def update
    if @venta.update(venta_params)
      render json: @venta
    else
      render json: @venta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /venta/1
  def destroy
    @venta.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Ventum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venta_params
      params.require(:venta).permit(:numero_transaccion, :usuario_id, :total_venta)
    end
end
