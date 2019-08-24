App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').empty();
    $('#messages').append '値は<b>' + data['message'] + '</b>ですよ'

  speak: (message) ->
    @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=chat_input]', (event) ->
    if event.keyCode is 13 # return = send
      App.chat.speak event.target.value
      event.target.value = ''
      event.preventDefault()

