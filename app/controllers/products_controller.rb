class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update]

  def index
    @products = Product.all
  end

  def new
    @product =  Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.required(:product).permit(:name, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
