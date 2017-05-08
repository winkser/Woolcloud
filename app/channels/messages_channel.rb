class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # This stream for watching self.
    # Another users can send message by user.id!

      @users = current_user.friends.all.where(confirm: "YES")

      @users.each do |f|
        if ((f.email <=> current_user.email)==1) then
          stream_from "messages_#{f.email}_#{current_user.email}"
        else
          stream_from "messages_#{current_user.email}_#{f.email}"
        end
      end

      stream_from "messages_#{current_user.email}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def action_on_server(data)
    
      if ((data["send_to"] <=> current_user.email)==1) then
        @canal = "messages_#{data["send_to"]}_#{current_user.email}"
      else
        @canal = "messages_#{current_user.email}_#{data["send_to"]}"
      end
        user = User.find_by_email(current_user.email)
        dialog = user.dialogs.find_by_name(@canal)

        sms = Message.new(email: current_user.email, message: data["text"])
        dialog.messages << sms


    ActionCable.server.broadcast \
       @canal, {sender: current_user.email, send_to: data["send_to"], text: data["text"], time: Time.now}
  end
end
