class Admin::HomeController < Admin::AdminController
  layout "admin"
  
  def index
    if user_signed_in?
      
    else
      redirect_to new_user_session_path
    end
  end
  
end