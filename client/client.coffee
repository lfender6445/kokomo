Meteor.startup ->
  Meteor.subscribe('messages')
  # TODO: add to meteor methods
  subscribeUsers()
