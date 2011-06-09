module ApplicationHelper
  def home_page
    controller_path == "projects" and  params[:action] == "index"
  end
end
