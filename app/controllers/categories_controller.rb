class CategoriesController < ApplicationController
  def show
  end

  def new

  end

  def create
    @category = @product.categories.build(category_params)
    if @category.save
      render '/prodcuts/new'
    else
      render "products/#{@product.id}"
    end
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
