class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  def index
    @carts = Cart.all
    render json: @carts, include: [:items]
  end

  # GET /carts/1
  def show
    render json: @cart, include: [:items]
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart, include: [:items]
    else
      
    end
  end

#PATCH /carts/1/remove

def remove
  cart = Cart.find((params[:cart_id].to_i))
  item = Item.find(params[:cart][:item_ids])
  apearances = cart.items.collect do |i|
    return i.name == item.name
  end 
  # cart.items.delete(item)
  # cart.save!
  # if cart.save
  #   render json: cart, include: [:items]
  # else

  # end 
end 

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to carts_url, notice: 'Cart was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:id, :total, :user_id, item_ids: [])
    end

end
