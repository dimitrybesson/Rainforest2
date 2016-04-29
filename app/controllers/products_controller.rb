class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = if params[:search]
      Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      Product.all
    end

    # if request.xhr?
    #   render @products
    # end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @reviews = @product.reviews

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
    @category = @product.categories.build
  end

  def create #add flash
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Added product successfully!'
      redirect_to root_url
    else
      flash[:error] = 'Error saving product.'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update # add flash
    # @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = 'Updated product successfully!'
      redirect_to products_url
    else
      flash[:error] = 'Error updating product.'
      render :edit
    end

    def destroy
      # @product = Product.find(params[:id])
      @product.destroy
      flash[:success] = 'Deleted product successfully!'
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
