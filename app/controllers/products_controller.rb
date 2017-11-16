class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'

  end
  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    product = Product.new(
      name: params[:name],
      image: params[:image],
      price: params[:price],
      description: params[:description]
      )
    product.save
    flash[:success] = "Sword created successfully!"
    redirect_to "/products/#{product.id}"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.name = params[:name]
    product.image = params[:image]
    product.price = params[:price]
    product.description = params[:description]
    product.save
    flash[:danger] = "Sword updated successfully!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    flash[:success] = "Sword destroyed successfully!"
    redirect_to '/'
  end
end
