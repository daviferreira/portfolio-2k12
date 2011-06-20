# -*- encoding : utf-8 -*-
class Admin::UsersController < Admin::AdminController

  layout "admin"
  
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def edit

  end

end
