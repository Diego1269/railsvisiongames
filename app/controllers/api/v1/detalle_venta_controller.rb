class Api::V1::DetalleVentaController < ApplicationController
  before_action :set_detalle_venta, only: %i[ show update destroy ]

  # GET /detalle_venta
  def index
    @detalle_venta = DetalleVentum.all

    render json: @detalle_venta
  end

  # GET /detalle_venta/1
  def show
    render json: @detalle_venta
  end

  # POST /detalle_venta
  def create
    @detalle_venta = DetalleVentum.new(detalle_venta_params)

    if @detalle_venta.save
      render json: @detalle_venta, status: :created
    else
      render json: @detalle_venta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /detalle_venta/1
  def update
    if @detalle_venta.update(detalle_venta_params)
      render json: @detalle_venta
    else
      render json: @detalle_venta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /detalle_venta/1
  def destroy
    @detalle_venta.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_venta
      @detalle_venta = DetalleVentum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detalle_venta_params
      params.require(:detalle_venta).permit(:venta_id, :producto_id, :cantidad, :precio, :total_venta)
    end
end
