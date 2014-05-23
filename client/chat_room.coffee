class ChatRoom
  constructor: ->
    Template.chat_rooms.rendered = @_room_bindings
    Template.chat_rooms.helpers(@view_helpers())

  _room_bindings: ->
    $('#room_1, #room_2, #room_3').click (event) ->
      id = event.currentTarget.id
      room_id = id.slice(id.length - 1)
      if room_id
        subscribeUsers(room_id)
        Meteor.subscribe('messages', room_id, -> )

  online_users: ->
    Meteor.users.find({'status.online': true}).fetch({})

  view_helpers: ->
    users_in_room: (room_id) =>
      all_users_in_room = []
      $.each @online_users(), (index, user) ->
        if user && user.status && user.profile.room == "#{room_id}"
          all_users_in_room.push user
      all_users_in_room

chat_room = new ChatRoom()
