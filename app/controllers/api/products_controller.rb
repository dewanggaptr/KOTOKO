class Api::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    # @products = Product.all
    @products = Product.search_product(params[:name])

    render json: @products.map { |product| product.new_attributes}
  end

  def show
    render json: @product.new_attributes
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product.new_attributes, status: 201
    else
      render json: @product.errors, status: 422
    end
  end

  def update
    if @product.update(product_params)
      render json: @product.new_attributes
    else
      render json: @product.errors, status: 422
    end
  end

  def destroy
    @product.destroy

    render json: { success: "Success delete transaction" }, status: 200
  end

  # def search
  #   @parameter = params[:search].downcase
  #   @result = Product.all.where("lower(name) LIKE :search", search: "#{@parameter}")

  #   @result.each do |result|
  #     result.name
  #   end
  # end

  private
  def set_product
    @product = Product.find_by_id(params[:id])
      if @product.nil?
        render json: { error: "product not found" }, status: 404
      end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id)
  end
end
