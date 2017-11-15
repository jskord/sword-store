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
    render 'create.html.erb'
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
    render 'update.html.erb'
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    render 'destroy.html.erb'
  end
end
