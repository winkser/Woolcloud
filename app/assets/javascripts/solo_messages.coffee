# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(->
  #function for load code after body html!
  document.addEventListener 'DOMContentLoaded', (event) ->
    #action on enter

    document.onkeyup = (e) ->
      e = e or window.event
      if e.keyCode == 13
        document.getElementById('send_message').click()
      return

    #click on button for sending message

    document.getElementById('send_message').onclick = ->
      message = 
        text: document.getElementById('text').value
        send_to: document.getElementById('send_to').innerHTML
      App.messages.action_on_client message
      document.getElementById('text').value = ''
      return

    return
  return
).call this
