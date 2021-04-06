class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_order, only: [:cart, :add_item_to_cart, :checkout]
  before_action :set_order, only: [:place_order]
 
  def index
    @orders = current_user.orders
  end

  def cart
  end

  def checkout
  end

  def new
    @order = Order.new
  end

  def add_item_to_cart
    @order.line_items.create(product_id: params[:product_id], quantity: 1)
    redirect_back(fallback_location: root_path)
  end

  def create
    @order = Order.new(order_params) 
    if @order.save
      redirect
    else
      @order = Order.all
      flash[:error] ='Can not save'
      render 'new'
    end

  end

  def place_order
    @order.address = params[:order][:address]
    @order.phone = params[:order][:phone]
    @order.name = params[:order][:name]
    @order.status = 'placed'
    @order.save
    redirect_to orders_path
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes!(order_params)
    flash[:notice] = "#{@order.name} has been succesfully updated."
    end

  def total_price
    self.quantity * self.product.price
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  
  private

  def set_cart_order
    @order = current_user.orders.find_or_create_by(status: 'cart')
  end
   
  def set_order
    @order = Order.find(params[:id])
  end
end