class ProductsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_products
    @product = Product.find(params[:post_id])
  end

  def products
    params.require(:products).permit(:title, :category, :priority, :completed)
  end
end
