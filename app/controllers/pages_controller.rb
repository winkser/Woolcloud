class PagesController < ApplicationController
before_action :authenticate_user!
  def index
   @user = User.find_by_email(current_user[:email])
  end

  def friends  
  end

  def messages
  end

  def friends_on_map
  end

  def galleries
    @user = User.find_by_email(current_user[:email])
    @images = @user.images.all
    @image = @user.images.build
  end

  def cloud
  end

  def settings
   @current_user = current_user
   @user = User.new
  end
end
