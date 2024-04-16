class CategoriesController < ApplicationController
    def index 
        @category = Category.all
    end
    def new
        @category = Category.new(category_params)
        respond_to do |format|
            if @category.save
                respond_to do |format|
                  format.js {render inline: "location.reload();" }
                end
              else
                flash[:alert] = "Error add new category" 
                render :index
              end
        end
    end
    private
      def category_params
        params.require(:category).permit(:name)
      end
end
