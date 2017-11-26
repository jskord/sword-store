class ProductsController < ApplicationController
  def index
    if params[:discount] == "true"
      @products = []
      products = Product.all
      products.each do |product|
        if product.discount_item?
          @products << product
        end
      end
    else
      sort_attribute = params[:sort_by]
      sort_order = params[:sort_order]
      @products = Product.order(sort_attribute || :name => sort_order || :asc)
    end
    render 'index.html.erb'

  end
  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
    end
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
    flash[:success] = "Sword updated successfully!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    flash[:success] = "Sword destroyed successfully!"
    redirect_to '/'
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", '%' + search_term + '%')
    render 'index.html.erb'
  end
end
