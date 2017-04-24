class PagesController < ApplicationController
before_action :authenticate_user!
  def index
  end

  def friends
  @users = User.all 
  @user = User.find_by_email(current_user.email)
  @friends = @user.friends.all
  end

  def friends_add
   friend_add = params.require(:friend).permit(:name)
   users = User.all
   if (users.find_by_email(friend_add[:name])) && !(User.find_by_email(current_user.email).friends.find_by_name(friend_add[:name])) && (friend_add[:name] != current_user.email) then
   @user = User.find_by_email(current_user.email)
   @user.friends.create(name: friend_add[:name])
   redirect_to pages_friends_add_path
   else
   @error = "User not found or alredy exist!"
   @users = User.all 
   @user = User.find_by_email(current_user.email)
   @friends = @user.friends.all  
   render template: "pages/friends.html.erb"
   end
  end

  def friends_drop
   @user = User.find_by_email(current_user.email)
   @friend = @user.friends.find_by_id(params[:id])  
   @friend.destroy
   redirect_to pages_friends_add_path
  end

  def messages
  end

  def friends_on_map
  end

  def gallery
  end

  def cloud
  end

  def settings
  end
end
