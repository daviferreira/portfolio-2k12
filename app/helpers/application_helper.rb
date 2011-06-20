# -*- encoding : utf-8 -*-
module ApplicationHelper
  def home_page?
    controller_path == "projects" and  params[:action] == "index"
  end
    
  def blog_home_page?
    controller_path == "posts" and  params[:action] == "index"
  end
  
  def meta_title
    if @meta_title.nil? or @meta_title.empty?
      @meta_title = "Davi Ferreira - Programador PHP/MySQL, Rails, Ruby, Javascript, jQuery, HTML/CSS"
    end
    @meta_title
  end
  
  def meta_description
    if @meta_description.nil? or @meta_description.empty?
      @meta_description = "Página/portfolio pessoal do programador Davi Ferreira. Design, PHP/MySQL, Rails, Ruby, Javascript, jQuery, HTML/CSS";
    end
    @meta_description
  end
  
  def check_for_http(str)
    if (str[0,7] != "http://")
     str = "http://" + str
    end
    str
  end
end
