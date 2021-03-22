class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
 end

 def show
   @category = Category.find(params[:id])
 end

 def new
    @category = Category.new
 end


 def create
    @category = Category.new(category_params)

    if @category.save
       redirect_to :action => 'list'
    else
       @category = Category.all
       render :action => 'new'
    end
 end
 
 def edit
    @category = Category.find(params[:id])
    @category = Category.all
 end
 
 def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(category_param)
       redirect_to :action => 'show', :id => @category
    else
       @category = Category.all
       render :action => 'edit'
    end
 end
 
 def delete
  Category.find(params[:id]).destroy
    redirect_to :action => 'list'
 end
 
private 
 def category_params
   params.require(:category).permit(:name, :category_id)
end

end
