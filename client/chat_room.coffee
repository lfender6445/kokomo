class ChatRoom

  online_users: ->
    Meteor.users.find({'status.online': true}).fetch({})

  room_bindings: ->
    $('#room_1, #room_2').click (event) ->
      debugger
      if room =  @room_id(event.currentTarget.id)
        subscribeUsers(room)

  room_id: (elem_id) ->
    elem_id.slice(elem_id.length-1)

  view_helpers:
    users_in_room: (room_id) ->
      debugger
      all_users_in_room = []
      $.each @all_online_users, (index, user) ->
        if user.status && user.profile.room == "#{room_id}"
          all_users_in_room.push user
      all_users_in_room

@chat_room = new ChatRoom()
Template.chat_rooms.rendered = ->
   debugger
   @chat_room.room_bindings()
Template.chat_rooms.helpers(@chat_room.view_helpers)
