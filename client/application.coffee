if Meteor.isClient

  Template.hello.greeting = ->
    "Welcome to kokomo."

  Template.hello.events "click input": ->
    # template data, if any, is available in 'this'
    console.log "You pressed the button"  if typeof console isnt "undefined"
    return

  Template.chat_rooms.rendered = ->
    $('#room_1').click (event) ->
      Meteor.subscribe(
        'user_data',
        { id: Meteor.userId(), room: 1 },
        ->
          Session.set 'current_room', 1
      )

  Template.chat_rooms.helpers
    user_in_room: (room_id) ->
      if user = Meteor.user()
        user.profile.room == room_id
