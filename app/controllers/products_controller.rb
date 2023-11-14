class ProductsController < ApplicationController
  before_action :find_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Successfully Added"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :quantity)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
