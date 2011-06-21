# -*- encoding : utf-8 -*-
class Admin::UsersController < Admin::AdminController

  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

end
