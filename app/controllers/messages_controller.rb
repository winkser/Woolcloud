class MessagesController < ApplicationController

  def messages
   @users = User.all
   @user = User.find_by_email(current_user.email)
   @friends = @user.friends.all.where(confirm: "YES")
#    render plain: @friends.inspect
   render template: "pages/messages.html.erb"
  end

  def send_to
   @send_to = User.find_by_email(params[:email])
   render template: "pages/solo_messages.html.erb"
  end


end
