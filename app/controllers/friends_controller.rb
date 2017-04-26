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
   #то добавить пользователя и пометить, связь двусторонняя(у обоих)
   @user.friends.create(email: friend_add[:email], confirm: "YES")
   @target_friend = User.find_by_email(friend_add[:email]).friends.find_by_email(current_user[:email])
   @target_friend.confirm = "YES"
   @target_friend.save
   else
   #у добавляемого пользователя не найден, односторонняя связь
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
