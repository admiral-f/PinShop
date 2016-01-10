class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:new, :create, :index]
  def index
    redirect_to pins_path
  end

  def new
    if current_user.username=='admin'
      
    else
      redirect_to pins_path

    end
  end

  def show
    @categories=Category.all
    @category=Category.find(params[:id])
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to index_path
    else
      render action: 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
