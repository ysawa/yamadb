class ProductsController < ApplicationController
  respond_to :html

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
    @product = Product.find_by_code(params[:id])
    flash[:notice] = "Product successfully destroyed." if @product.destroy
    respond_with(@product, :location => products_url)
  end

  # GET /products/1/edit
  def edit
    respond_with(@product = Product.find_by_code(params[:id])) do |format|
      format.html { render :action => :edit }
    end
  end

  # GET /products
  def index
    respond_with(@products = Product.all)
  end

  # GET /products/new
  def new
    respond_with(@product = Product.new)
  end

  # GET /products/1
  def show
    respond_with(@product = Product.find_by_code(params[:id]))
  end

  # PUT /products/1
  def update
    @product = Product.find_by_code(params[:id])
    flash[:notice] = "Product successfully updated." if @product.update_attributes(params[:product])
    respond_with(@product, :location => products_url)
  end
end
