class HomeController < ApplicationController
  def index
    @categories = Category.all
    @users = User.all
    @products = Product.all

  end
end
