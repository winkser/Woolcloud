App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    console.log "You are connected to the server!"
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log "You are disconnected from server!"
    # Called when the subscription has been terminated by the server

  received: (data) ->

    if document.getElementById('current_user').innerHTML != data['sender']  
      document.getElementById('message_sender').innerHTML = "★Message from "+"<a href='/pages/messages/send_to/" + data['sender']+"'>"+data['sender']+"</a>★" 

    console.log data

    if document.getElementById('current_page').innerHTML == "Dialog" 
      if document.getElementById('send_to').innerHTML == data['sender'] 
        document.getElementById('received_message_sender').innerHTML = data['sender'] 
        document.getElementById('received_message_text').innerHTML = data['text'] 


    # Called when there's incoming data on the websocket for this channel

  action_on_client: (data) ->
    #data - object which contain 'text'="messages" and 'send_to'=destination_user_id
    #message {'text'="hello", 'send_to'=1} sended "hello" to user with id=1
    #in js object like this
    #
    # var sms = new Object(); 
    #  sms['send_to'] = 1;
    #  sms['text'] = "hello";
    #
    # App.messages.action_on_client(sms)
    # And sms will be sended 

    @perform('action_on_server', text: data['text'], send_to: data['send_to'])
