class ProductsController < ApplicationController
  respond_to :html
  before_filter :find_product, :only => [:destroy, :edit, :show, :update]

  # POST /products
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Product successfully created"
      respond_with(@product, :location => products_url)
    else
      respond_with(@product)
    end
  end

  # DELETE /products/1
  def destroy
    flash[:notice] = "Product successfully destroyed." if @product.destroy
    respond_with(@product, :location => products_url)
  end

  # GET /products/1/edit
  def edit
    respond_with(@product) do |format|
      format.html { render :edit }
    end
  end

  # GET /products
  def index
    if params[:group] =~ /^(sporting_goods|books)$/
      @products = Product.send(params[:group])
    else
      @products = Product.all
    end
    @products = @products.page(params[:page]).per(10)
    respond_with(@products)
  end

  # GET /products/new
  def new
    respond_with(@product = Product.new)
  end

  # GET /products/1
  def show
    respond_with(@product)
  end

  # PUT /products/1
  def update
    flash[:notice] = "Product successfully updated." if @product.update_attributes(params[:product])
    respond_with(@product, :location => products_url)
  end
private
  def find_product
    @product = Product.find(params[:id])
  end
end
