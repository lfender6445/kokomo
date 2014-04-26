if Meteor.isClient

  Template.hello.greeting = ->
    "Welcome to kokomo."

  Template.hello.events "click input": ->
    # template data, if any, is available in 'this'
    console.log "You pressed the button"  if typeof console isnt "undefined"
    return

  Template.chat_rooms.rendered = ->
    $('#room_1, #room_2').click (event) ->
      id = event.target.id
      room_id = id.slice(id.length-1)
      console.log room_id
      Meteor.subscribe(
        'user_data',
        { id: Meteor.userId(), room: room_id },
        ->
          Session.set 'current_room', room_id
      )

  Template.chat_rooms.helpers
    user_in_room: (room_id) ->
      if user = Meteor.user()
        user.profile.room == "#{room_id}"
