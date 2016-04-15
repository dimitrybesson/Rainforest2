class CategoriesController < ApplicationController
  def show
  end

  def create
    @category = @product.categories.build(category_params)
    if @category.save
      redirect_to root_url
    else
      render :product_url(@product)
    end
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
