class Admin::ProductsController < AdminController
  def index
    @products = Product.includes(:category).all
    end
    
    def new
      @categories = Category.all
      @product = Product.new
    end
    
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path
      else
        @categories = Category.all
        flash[:error] ='Can not save'
        render 'new'
      end
    end
    
    def edit
    @products = Product.find(params[:id])
    end
    
    def update
    @products = Products.find(params[:id])
    @products.update_attributes!(product_params)
    flash[:notice] = "#{@products.name} has been succesfully updated."
    redirect_to root_path
    end

    def destroy
    @products = Product.find(params[:id])
    @products.destroy
    flash[:notice] = "Your product '#{@products.name}' has been deleted."
    redirect_to root_path
    end
    
    private
    def product_params
      params.require(:product).permit(:name, :price, :product_description, :category_id)
    end
end
