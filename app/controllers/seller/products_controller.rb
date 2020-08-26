class Seller::ProductsController < Seller::ApplicationController
  before_action :set_products, only: %i[edit update destroy]

  def index
    @products = current_seller.products
  end

  def new
    @product = current_seller.products.build
  end

  def create
    @product = current_seller.products.build(product_params)
    if @product.save
      redirect_to seller_products_path, notice: 'Product created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to seller_products_path, notice: 'Product updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to seller_products_path, notice: 'Product deleted successfully'
  end

  private

  def product_params
    params.require(:product).permit(:name, :quantity, :code)
  end

  def set_products
    @product = current_seller.products.find params[:id]
  end
end
