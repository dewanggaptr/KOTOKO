class Api::CategoryController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    @categories = Category.all

    render json: @categories.map { |category| category.new_attributes}
  end

  def show
    render json: @category.new_attributes
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category.new_attributes, status: 201
    else
      render json: @category.errors, staus: 422
    end
  end

  def update
    if @category.update(category_params)
      render json: @category.new_attributes
    else
      render json: @category.errors, status: 422
    end
  end

  def destroy
    @category.destroy

    render json: { success: "Success delete category" }, status: 200
  end

  private
  def set_category
    
    @category = Category.find_by_id(params[:id])
    if @category.nil?
      render json: { error: "Category not found" }, status: 404
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
