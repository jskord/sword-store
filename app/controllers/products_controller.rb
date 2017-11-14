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
    render 'edit.html.erb'
  end
end
