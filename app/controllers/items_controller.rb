class ItemsController < ApplicationController
  respond_to :html

  # POST /items
  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Item successfully created"
      respond_with(@item, :location => items_url)
    else
      respond_with(@item)
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find_by_code(params[:id])
    flash[:notice] = "Item successfully destroyed." if @item.destroy
    respond_with(@item, :location => items_url)
  end

  # GET /items/1/edit
  def edit
    respond_with(@item = Item.find_by_code(params[:id])) do |format|
      format.html { render :action => :edit }
    end
  end

  # GET /items
  def index
    respond_with(@items = Item.all)
  end

  # GET /items/new
  def new
    respond_with(@item = Item.new)
  end

  # GET /items/1
  def show
    respond_with(@item = Item.find_by_code(params[:id]))
  end

  # PUT /items/1
  def update
    @item = Item.find_by_code(params[:id])
    flash[:notice] = "Item successfully updated." if @item.update_attributes(params[:item])
    respond_with(@item)
  end
end
