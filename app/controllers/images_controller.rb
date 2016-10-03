class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Woohoo! You successfully uploaded an image!"
      redirect_to images_path
    else
      flash[:alert] = "Whoops, your image was not uploaded."
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Your image has been edited!"
      redirect_to images_path
    else
      flash[:alert] = "Whoops, your image was not edited!"
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Your image has been deleted!"
    redirect_to images_path
  end

private
  def image_params
    params.require(:image).permit(:title, :user_id, :image)
  end
end
