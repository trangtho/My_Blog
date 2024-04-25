class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        respond_to do |format|
          format.js { render inline: 'location.reload();' }
        end
      else
        flash[:alert] = 'Error add new category'
        render :index
      end
    end

  def destroy
    debugger
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to category_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue StandardError
    redirect_to root_path
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
