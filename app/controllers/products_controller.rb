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
    @reviews = @product.reviews.includes(:user)
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
    if @product.save
      flash[:notice] = 'You have successfully create product!'
      redirect_to category_products_path(@category)
    else
      respond_with(@product)
    end
  end

  def update
    @product.update(product_params)
    if @product.save
      flash[:notice] = 'You have successfully update product!'
      redirect_to category_product_path(@product.category, @product)
    else
      respond_with(@product)
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = 'You have successfully delete product!'
      redirect_to category_products_path(@category)
    else
      respond_with(@product)
    end
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
    params.require(:product).permit(:title, :description, :category_id, :image)
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
