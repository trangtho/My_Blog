class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        respond_to do |format|
          format.js { render inline: 'location.reload();' }
        end
      else
        flash[:alert] = 'Error add new category'
        render :index
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @postcategories_to_delete = @category.postcategories.where(params[:category_id])
    @postcategories_to_delete.destroy_all
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
