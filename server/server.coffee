Accounts.onCreateUser (options, user) ->
  options.profile.avatar = user.services.google.picture
  options.profile.email  = user.services.google.email
  options.profile.room = 0
  return options

Meteor.publish 'all_users', (opts) ->
  if opts
    Meteor.users.update(
      { _id: opts['id'] },
      { $set: { 'profile.room': opts['room'] } }
    )
    this.ready()
    return Meteor.users.find({})


