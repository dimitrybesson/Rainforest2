class ReviewsController < ApplicationController
  before_action :load_product, only: [:create, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: %i(create destroy)

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to product_url(@product), notice: 'Review created successfully!'
    else
      render 'products/show' # can you render a path?
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to product_url(@product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), notice: 'Deleted review'
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
