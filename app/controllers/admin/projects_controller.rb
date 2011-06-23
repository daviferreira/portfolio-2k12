# -*- encoding : utf-8 -*-
class Admin::ProjectsController < Admin::AdminController
 
  before_filter :authenticate_user!

  def index
    @projects = Project.order("due_date DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @project = Project.find_using_slug(params[:id])
  end

  def new
    @project = Project.new 
  end
  
  def edit
    @project = Project.find_using_slug(params[:id])
  end

  def create
    @project = Project.create(params[:project])
    if @project.save
      @project.generate_slug!
      flash[:success] = "Projeto cadastrada com sucesso."
      redirect_to admin_projects_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find_using_slug(params[:id])

    if @project.update_attributes(params[:project])
      flash[:success] = "Projeto editada com sucesso."
      redirect_to admin_projects_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @project = Project.find_using_slug(params[:id])
		@project.destroy
		flash[:success] = "Projeto excluída com sucesso"
		redirect_to admin_projects_path
  end

  

	def destroy_screenshot
    @project = Project.find_using_slug(params[:id])
    @project.update_attributes(:screenshot => nil)
    respond_to do |format|
			format.html { redirect_to admin_edit_project_path(@project) }
			format.js
		end
	end

end
