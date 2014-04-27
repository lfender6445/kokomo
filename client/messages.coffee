Messages = new Meteor.Collection('messages')

Template.messages.messages = ->
  Meteor.subscribe('messages')
  # TODO: last 10 messages
  Messages.find({}, sort: time: 1)

Template.input.events =
  "keydown input#message": (event) ->
    if event.which is 13 # 13 is the enter key event
      if Meteor.user()
        name = Meteor.user().profile.email
      else
        name = "Anonymous"
      message = document.getElementById("message")
      unless message.value is ""
        Messages.insert
          name: name
          message: message.value
          time: Date.now()
        document.getElementById("message").value = ""
        message.value = ""
