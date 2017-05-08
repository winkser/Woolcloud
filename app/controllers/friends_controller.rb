class FriendsController < ApplicationController
before_action :authenticate_user!
  def friends
   @users = User.all
   @user = User.find_by_email(current_user.email)
   @friends = @user.friends.all
   render template: 'pages/friends.html.erb'
  end

  def friends_add
   friend_add = params.require(:friend).permit(:email)
   @users = User.all
   @user = User.find_by_email(current_user.email)
   @friends = @user.friends.all

   if (@users.find_by_email(friend_add[:email])) && !(User.find_by_email(current_user.email).friends.find_by_email(friend_add[:email])) && (friend_add[:email] != current_user.email) then
   @target_friend = User.find_by_email(friend_add[:email])
   if @target_friend.friends.find_by_email(current_user[:email]) then
   #duplex connection
   @user.friends.create(email: friend_add[:email], confirm: "YES")
   @target_friend = User.find_by_email(friend_add[:email]).friends.find_by_email(current_user[:email])
   @target_friend.confirm = "YES"
   @target_friend.save

   #create dialogs
   @user2 = User.find_by_email(friend_add[:email])
   if (!(Dialog.find_by_name("messages_#{@user.email}_#{@user2.email}")||Dialog.find_by_name("messages_#{@user2.email}_#{@user.email}"))) then
   if ((@user2.email <=> @user.email)==1) then
     @dialog = Dialog.new(name: "messages_#{@user2.email}_#{@user.email}")
   else
     @dialog = Dialog.new(name: "messages_#{@user.email}_#{@user2.email}")
   end
     @user.dialogs << @dialog
     @user2 = User.find_by_email(@user2.email)
     @user2.dialogs << @dialog
   end
   #end create dialogs

   else
   #simplex connection
   @user.friends.create(email: friend_add[:email], confirm: "NO")
   end
   redirect_to action: :friends
   else
   @error = "User not found or alredy exist!"
   render template: 'pages/friends.html.erb'
   end
  end

  def friends_drop
   @friend = User.find_by_email(current_user.email).friends.find_by_id(params[:id])
   if @friend.confirm = "YES" then
   if !(@target_friend = User.find_by_email(@friend.email).friends.find_by_email(current_user[:email])).nil? then
   @target_friend.confirm = "NO"
   @target_friend.save
   end
   end
   @friend.destroy
   redirect_to action: :friends
  end

end
