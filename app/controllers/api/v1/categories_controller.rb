class Api::V1::CategoriesController < ApplicationController
  def index
    render json: Category.all
  end

  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Category.find(params[:id]).destroy!

    head :no_content
  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end
end