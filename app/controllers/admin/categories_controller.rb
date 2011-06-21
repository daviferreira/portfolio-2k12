# -*- encoding : utf-8 -*-
class Admin::CategoriesController < Admin::AdminController
  layout "admin"
  
  before_filter :authenticate_user!

  def index
    @categories = Category.order("name ASC").paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @category = Category.new 
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
end
