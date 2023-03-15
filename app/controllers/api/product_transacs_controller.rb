class Api::ProductTransacsController < ApplicationController
  before_action :set_product_transac, only: :destroy

  def index
    @product_transac = ProductTransac.all

    render json: @product_transac.map { |product_transac| product_transac.new_attributes }
  end

  def create
    @product_transac = ProductTransac.new(product_transac_params)

    if @product_transac.save
      render json: @product_transac.new_attributes, status: 201
    else
      render json: @product_transac.errors, status: 422
    end
  end

  def destroy
    @product_transac.destroy
  end

  private
    def set_product_transac
      @product_transac = ProductTransac.find_by_id(params[:id])
      if @product_transac.nil?
        render json: { error: "Product Transactions not found" }, status: 404
      end
    end

    def product_transac_params
      params.require(:product_transac).permit(:quantity, :discount, :price, :transaction_id, :product_id)
    end
end
