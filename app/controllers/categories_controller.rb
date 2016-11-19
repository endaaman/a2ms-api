class CategoriesController < ApplicationController
  before_action :needs_authorized, only: [:create, :destroy, :update]

  def category_params
    params.require(:category).permit(
      :slug,
      :order,
      :name_en,
      :name_ja,
      :image_url,
      :desc_en,
      :desc_ja,
    )
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new category_params
    success = @category.save
    render status: success ? 201 : 422
  end

  def update
    @category = Category.find_by id: params[:id]
    @category.update category_params
  end

  def destroy
    Category.destroy params[:id]
    head 204
  end

end
