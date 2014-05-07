@subscribeUsers = (room_id = 0) ->
  console.log room_id
  Meteor.subscribe(
    'all_users',
    { id: Meteor.userId(), room: room_id },
    ->
      Session.set 'current_room', room_id
  )

Template.users.helpers
  users: -> Meteor.users.find().fetch()
