class ReviewsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_reviewable

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = 'You have successfully create review!'
    else
      errors_msgs = @review.errors.full_messages.join(';')
      flash[:alert] = "Your review has errors: #{errors_msgs}"
    end

    redirect_to(request.referer)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_reviewable
    if pid = params[:product_id]
      @product = Product.find(pid)
    end
  end

  def review_params
    params.require(:review).permit(:msg, :product_id)
  end

  def resolve_layout
    'admin'
  end
end
