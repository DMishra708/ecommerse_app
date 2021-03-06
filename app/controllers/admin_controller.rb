class AdminController < ApplicationController
  before_action :is_admin?

  private

  def is_admin?
    redirect_to root_path unless current_user&.admin? 
  end
  
  def show
    @order = Order.all
  end

end
