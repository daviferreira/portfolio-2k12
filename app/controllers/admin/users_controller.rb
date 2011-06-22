# -*- encoding : utf-8 -*-
class Admin::UsersController < Admin::AdminController

  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Usuário atualizado com sucesso."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Usuário excluído com sucesso."
      redirect_to admin_users_path
    end
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
