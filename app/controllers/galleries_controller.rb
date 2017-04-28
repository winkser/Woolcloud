class GalleriesController < ApplicationController

  def create_image
   @user = User.find_by_email(current_user[:email])
   @image = @user.images.build(params.require(:image).permit(:name, :file))
   @image.save
     redirect_to pages_galleries_path
  end
 
  def delete
   @images = User.find_by_email(current_user[:email]).images
   @images.delete(@images.find_by_id(params[:id]))
     redirect_to pages_galleries_path
  end

end
