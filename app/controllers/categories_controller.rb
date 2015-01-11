class CategoriesController < ApplicationController

  layout :resolve_layout

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  respond_to :html


  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    redirect_to category_products_path(params[:id])
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def resolve_layout
    case action_name
    when 'show'
      'application'
    else
      'admin'
    end
  end
end
