class PhotosController < ApplicationController
  def index
    if params[:flickr_info]
      @flickr_info = params_user_id
      @photos_list = Photo.fetch(@flickr_info[:user_id])
      if @photos_list
        render "index"
      else
        flash[:error] = "Enter valid user_id" 
        render "index"
      end
    end
  end

  private

  def params_user_id
    params.require(:flickr_info).permit(:user_id)
  end
end
