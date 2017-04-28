class GalleriesController < ApplicationController

  def create_image
   @user = User.find_by_email(current_user[:email])
   @image = @user.images.build(params.require(:image).permit(:name, :file))
   @image.save
     redirect_to pages_gallery_path
  end

end
