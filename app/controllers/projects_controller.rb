class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
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
		
		# temp live search
		@live = Project.published.limit(5)
		
		@pg_atual = params[:pg_atual]
		@pg_click = params[:pg_click]

		@projects = Project.published.limit(50).paginate(:page => params[:page], :per_page => 6)
    @posts = Post.published.limit(3)
    @categories = Category.where("area = 1")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
      format.js
    end
  end
  
  def live_search
    q = (params[:q] + "%").downcase
    @projects = Project.published.where("lower(name) LIKE ? OR lower(tags) LIKE ?", q, "%"+q).limit(5)
    respond_to do |format|
      format.js
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @categories = Category.where("area = 1")
    @project = Project.find_using_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find_using_slug(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find_using_slug(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find_using_slug(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end