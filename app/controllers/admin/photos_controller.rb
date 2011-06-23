# -*- encoding : utf-8 -*-
class Admin::PhotosController < Admin::AdminController
 
  before_filter :authenticate_user!

  def index
    @photos = Photo.order("project_id ASC").paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new 
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.create(params[:photo])
    if @photo.save
      flash[:success] = "Screenshot cadastrada com sucesso."
      redirect_to admin_photos_path
    else
      render 'new'
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      flash[:success] = "Screenshot editada com sucesso."
      redirect_to admin_photos_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
		@photo.destroy
		flash[:success] = "Screenshot excluída com sucesso"
		redirect_to admin_photos_path
  end
  
  

	def destroy_photo
    @photo = Photo.find(params[:id])
    @photo.update_attributes(:photo => nil)
    respond_to do |format|
			format.html { redirect_to admin_edit_photo_path(@photo) }
			format.js
		end
	end

end