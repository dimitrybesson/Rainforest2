class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    # @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create #add flash
    @product = Product.new(product_params)
    if @product.save
      # redirect_to product_url(@product)
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update # add flash
    # @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_url(@product)
    else
      render :edit
    end

    def destroy
      # @product = Product.find(params[:id])
      @product.destroy
      redirect_to root_url
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
