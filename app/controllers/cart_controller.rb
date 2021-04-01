class CartController < ApplicationController
def index
  @cart = ShoppingCart.get()
end

def create
  cart = ShoppingCart.add(LineItem.new(product: Product.new(id: params[:product]), quantity: params[:quantity]))

  respond_to do |format|
    msg = { total: cart.total, count: cart.count }
    format.json  { render :json => msg }
  end


  def delete
    cart = ShoppingCart.remove(params[:id])
    respond_to do |format|
      msg = { total: cart.total, count: cart.count }
      format.json  { render :json => msg }
    end
end

end
