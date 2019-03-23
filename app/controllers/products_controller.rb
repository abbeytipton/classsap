class ProductsController < ApplicationController

# Creates new product instance
  def new
    @product = Product.new
  end

# Defines what new product is and saves, then redirects to the edit store page, flashes success message if product is added
  def create
    @product = Product.new(product_params)
    if @product.save
        redirect_to '/pages/estore'
        flash[:notice] = " Product added successfully! "
      else
        redirect_to '/pages/estore'
    end
  end

# Deletes a product
  def destroy
    Product.find(params[:id]).destroy
    flash[:delete] = " Product deleted successfully! "
    redirect_to '/pages/estore'
  end

# Edits a product
  def edit
    @product = Product.find(params[:id])
  end

# Updates a product based on user input
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to '/pages/estore'
      flash[:notice] = " Product updated successfully! "
    else
      redirect_to '/pages/estore'
    end
  end

  private

  # Defines params needed for product to be set up, also allows teacher_id to come through from hidden field
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :teacher_id)
  end

end
