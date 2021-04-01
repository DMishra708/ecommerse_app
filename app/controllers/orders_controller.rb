class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def add_item_to_cart
    byebug
    @order = current_user.orders.find_or_create_by(status: 'cart')
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

  def update
    @order = Order.find(params[:id])
    @order.update_attributes!(order_params)
    flash[:notice] = "#{@order.name} has been succesfully updated."
    end

  def total_price
    self.quantity * self.product.price
  end
   
end
