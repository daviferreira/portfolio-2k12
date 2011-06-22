# -*- encoding : utf-8 -*-
class Admin::CategoriesController < Admin::AdminController
 
  before_filter :authenticate_user!

  def index
    @categories = Category.order("name ASC").paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @category = Category.find_using_slug(params[:id])
  end

  def new
    @category = Category.new 
  end
  
  def edit
    @category = Category.find_using_slug(params[:id])
  end

  def create
    @category = Category.create(params[:category])
    if @category.save
      @category.generate_slug!
      flash[:success] = "Categoria cadastrada com sucesso."
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Category.find_using_slug(params[:id])

    if @category.update_attributes(params[:category])
      flash[:success] = "Categoria editada com sucesso."
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find_using_slug(params[:id])
		@category.destroy
		flash[:success] = "Categoria excluída com sucesso"
		redirect_to admin_categories_path
  end

end
