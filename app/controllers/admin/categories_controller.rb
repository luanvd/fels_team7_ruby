class Admin::CategoriesController < ApplicationController
	#Set Layout Admin
	layout "admin"
	def index
		@categories = Category.all
	end
	def create
		@category = Category.new(category_params)

		if @category.save
			redirect_to [:admin, @category]
		else
			render :new
		end
	end
	def show
		@category = Category.find params[:id]
	end
	def new	
		@category = Category.new
	end
	#
	def edit
  		@category = Category.find(params[:id])   
  	end
  	#
  	def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Updated"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
	#Destroy
	def destroy
    	Category.find(params[:id]).destroy      	
      flash[:success] = "Destroyed"
      redirect_to admin_categories_path    
  	end
  	private 
  		def category_params
  			params.require(:category).permit(:name)
  		end
end	