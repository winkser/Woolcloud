class MessagesController < ApplicationController

  def messages
   @users = User.all
   @user = User.find_by_email(current_user.email)
   @friends = @user.friends.all.where(confirm: "YES")
   
   render template: "pages/messages.html.erb"
  end

  def send_to
   @send_to = User.find_by_email(params[:email])
   @user = User.find_by_email(current_user.email)

   if ((@user.email <=> @send_to.email)==1) then
     @messages = @user.dialogs.find_by_name("messages_#{@user.email}_#{@send_to.email}").messages.last(5)
   else
     @messages = @user.dialogs.find_by_name("messages_#{@send_to.email}_#{@user.email}").messages.last(5)
   end

   render template: "pages/solo_messages.html.erb"
  end


end
