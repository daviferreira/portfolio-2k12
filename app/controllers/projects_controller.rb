# -*- encoding : utf-8 -*-
class ProjectsController < ApplicationController

  before_filter :initiate_contact

  def index
    
		@pg_atual = params[:pg_atual]
		@pg_click = params[:pg_click]

    if params[:category]
      @category = Category.find_using_slug(params[:category])
      @projects = Project.published.where("category_id = #{@category.id}").limit(30).paginate(:page => params[:page], :per_page => 6)
      @meta_title = "#{@category.name} - Projetos na categoria #{@category.name} - DaviFerreira.com"
      @meta_description = "Lista de trabalhos do programador PHP/Ruby Davi Ferreira na categoria #{@category.name} - DaviFerreira.com"
    elsif params[:tag]
      q = translate_tag(params[:tag]).downcase

		  @projects = Project.published.where("lower(tags) LIKE ? OR lower(tags) LIKE ? OR lower(tags) LIKE ? OR lower(tags) = ?", q+",%", "%,"+q+",%", "%,"+q, q).limit(30).paginate(:page => params[:page], :per_page => 6)
		  @meta_title = translate_tag(params[:tag]) + " - Projetos com a tag " + translate_tag(params[:tag]) + " - DaviFerreira.com"
		  @meta_description = "Lista de trabalhos do programador PHP/Ruby Davi Ferreira com a tag " + translate_tag(params[:tag]) + " - DaviFerreira.com"
		elsif params[:search]
		  q = "%" + params[:search].downcase + "%"
      @projects = Project.published.where("name LIKE ? OR tags LIKE ? OR description LIKE ?", q, q, q).limit(30).paginate(:page => params[:page], :per_page => 6)
      @meta_title = "#{params[:search]} - Resultado da busca - DaviFerreira.com"
		  @meta_description = "Resultado da busca de trabalhos do programador PHP/Ruby Davi Ferreira para #{params[:tag]}"
		  @search = params[:tag]
    else
		  @projects = Project.published.limit(30).paginate(:page => params[:page], :per_page => 6)
	  end
		
    @posts = Post.published.limit(3)
    @categories = Category.where("area = 1")
  end
  
  def live_search
    q = params[:q].downcase
    @projects = Project.published.where("lower(name) LIKE ? OR lower(tags) LIKE ? OR lower(tags) LIKE ? OR lower(tags) LIKE ? OR lower(tags) = ?", q + "%", q+",%", "%,"+q+",%", "%,"+q, q).limit(5)
    respond_to do |format|
      format.js
    end
  end

  def show
    @categories = Category.where("area = 1")
    @project = Project.published.find_using_slug(params[:id])
    @related = Project.published.where("category_id = ? AND id != ?", @project.category_id, @project.id).shuffle().slice(0..3)
    @meta_title = "#{@project.name} - Detalhes do projeto - DaviFerreira.com"
	  @meta_description = @project.description
  end
  
  private
    def initiate_contact
      @contact = Contact.new(:id => 1)
    end
    
    def translate_tag(tag)
      translations = {
        "criacao"  => "criação",
        "cartao-de-visita" => "cartão de visita",
        "saude" => "saúde",
        "apresentacao" => "apresentação",
        "forum" => "fórum",
        "volei" => "vôlei",
        "clinica" => "clínica",
        "musica" => "música",
        "promocao" => "promoção"
      }
      tag = translations[tag] if translations[tag]
      tag
    end
end
