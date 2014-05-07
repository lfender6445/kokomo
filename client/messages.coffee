Template.messages.messages = ->
  # TODO: last 10 messages
  if user = Meteor.user()
    Messages.find({ room: "#{user.profile.room}" }, sort: time: 1)

Template.message_input.events =
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
          room: Meteor.user().profile.room
          message: message.value
          time: Date.now()
        document.getElementById("message").value = ""
        message.value = ""
