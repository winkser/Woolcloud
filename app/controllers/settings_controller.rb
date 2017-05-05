class SettingsController < ApplicationController

  def settings
   @current_user = current_user
   @user = User.new
  end

  def create_avatar
    @you = User.find_by_email(current_user[:email])
    @you.update_attributes(params.require(:user).permit(:avatar))
    @you.save
    redirect_to pages_settings_path
  end

end
