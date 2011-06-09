class ProjectsController < ApplicationController

  before_filter :initiate_contact

  def index
    
    # temp slug
		Project.all.each do |o|
			o.generate_slug!
		end
		Category.all.each do |o|
			o.generate_slug!
		end
		Post.all.each do |o|
			o.generate_slug!
		end
		
		@pg_atual = params[:pg_atual]
		@pg_click = params[:pg_click]

    if params[:category]
      @category = Category.find_using_slug(params[:category])
      @projects = Project.published.where("category_id = #{@category.id}").limit(30).paginate(:page => params[:page], :per_page => 6)
    elsif params[:tag]
      q = translate_tag(params[:tag]).downcase

		  @projects = Project.published.where("lower(tags) LIKE ? OR lower(tags) LIKE ? OR lower(tags) LIKE ? OR lower(tags) = ?", q+",%", "%,"+q+",%", "%,"+q, q).limit(30).paginate(:page => params[:page], :per_page => 6)
		elsif params[:search]
		  q = "%" + params[:search].downcase + "%"
      @projects = Project.published.where("name LIKE ? OR tags LIKE ? OR description LIKE ?", q, q, q).limit(30).paginate(:page => params[:page], :per_page => 6)
    else
		  @projects = Project.published.limit(30).paginate(:page => params[:page], :per_page => 6)
	  end
		
    @posts = Post.published.limit(3)
    @categories = Category.where("area = 1")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
      format.js
    end
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
    @project = Project.find_using_slug(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_using_slug(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        redirect_to(@project, :notice => 'Project was successfully created.')
      else
        render :action => "new"
      end
    end
  end

  def update
    @project = Project.find_using_slug(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        redirect_to(@project, :notice => 'Project was successfully updated.')
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @project = Project.find_using_slug(params[:id])
    @project.destroy

    redirect_to(projects_url)
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
        "clinica" => "clínica"
      }
      tag = translations[tag] if translations[tag]
      tag
    end
end