class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    render json: {item: @item }, status: 200
  end

  # GET /items/new
  def new
    @items = Item.all
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @items = Item.all
  end

  # POST /items
  # POST /items.json
  def create
    @items = Item.all
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Item was successfully created.'
      redirect_to new_item_path
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated.'
      redirect_to home_index_path
      # format.json { render :index, status: :ok, location: @item }
    else
      flash[:notice] = 'Item update failed.'
      render :edit
      # format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_name, :rate)
    end
end