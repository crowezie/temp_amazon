class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect_to @product
      # same as redirect_to product_path(@product)
    else
      # render will simply render the new.html.erb view in the views/products
      # directory. The #new action above will not be touched.
      render :new
    end
  end

  def index
    # @products = Product.all
    @products = Product.order(created_at: :DESC)
  end

  def show
    @reviews = @product.reviews.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def find_product
    @product = Product.find params[:id]
  end

end
