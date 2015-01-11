class ProductsController < ApplicationController

  layout :resolve_layout

  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories
  before_action :set_category

  respond_to :html

  def index
    @products = if @category
      @category.products.all
    else
      Product.all
    end

    respond_with(@products)
  end

  def show
    # TODO fix nil
    @reviews = @product.reviews.includes(:user).select{|p| !p.user_id.nil?}
    @review = @product.reviews.new
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.includes(:products).all
  end

  def set_category
    if cid = params[:category_id]
      @category = Category.find(cid)
    end
  end

  def product_params
    params.require(:product).permit(:title, :descripiton, :category_id)
  end

  def resolve_layout
    case action_name
    when 'index', 'show'
      'application'
    else
      'admin'
    end
  end
end
