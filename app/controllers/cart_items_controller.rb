class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :update, :destroy]

  # GET /cart_items
  def index
    user = User.find(params[:user_id])  
    @cart_items = user.cart_items.all

    render json: @cart_items
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    cart_items = CartItem.all
    if @cart_item.update(cart_item_params)
      render json: cart_items
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    cart_items = CartItem.all
    @cart_item.destroy
    render json: cart_items
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.require(:cart_item).permit(:name, :price, :user_id, :quantity)
    end
end
