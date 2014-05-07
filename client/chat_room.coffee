Template.chat_rooms.rendered = ->
  $('#room_1, #room_2, #room_3').click (event) ->
    id = event.currentTarget.id
    room_id = id.slice(id.length-1)
    if room_id
      subscribeUsers(room_id)

Template.chat_rooms.helpers
  users_in_room: (room_id) ->
    all_users_in_room = []
    # TODO: only fetch online users
    if users = Meteor.users.find().fetch({})
      $.each users, (index, user) ->
        if user.status
          if user.profile.room == "#{room_id}" && user.status.online
            all_users_in_room.push user
    all_users_in_room


