if Meteor.isClient

  Template.hello.greeting = ->
    "Welcome to kokomo."

  Template.hello.events "click input": ->
    console.log "You pressed the button"  if typeof console isnt "undefined"
    return

  Template.chat_rooms.rendered = ->
    $('#room_1, #room_2').click (event) ->
      id = event.target.id
      room_id = id.slice(id.length-1)
      Meteor.subscribe(
        'all_users',
        { id: Meteor.userId(), room: room_id },
        ->
          Session.set 'current_room', room_id
      )

  Template.chat_rooms.helpers
    users_in_room: (room_id) ->
      all_users_in_room = []
      if users = Meteor.users.find().fetch({})
        $.each users, (index, user) ->
          console.log user
          if user.profile.room == "#{room_id}"
            all_users_in_room.push user
      all_users_in_room

  Template.users.helpers
    users: ->
      Meteor.users.find().fetch()
