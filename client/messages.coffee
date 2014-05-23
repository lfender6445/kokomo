ENTER_KEY = 13
# View Helpers

Template.messages.messages = ->
  if user = Meteor.user()
    Messages.find({ room: "#{user.profile.room}" },
      { sort: { time: 1 }, limit: 50 })

Template.message_box.display_messages = ->
  user = Meteor.user()
  user and user.profile.room > 0

Template.message_box.toggle_display = ->
  toggle = Template.message_box.display_messages()
  if toggle then '' else 'hidden'

Template.message_input.events =
  "keydown input#message": (event) ->
    if event.which is ENTER_KEY
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

