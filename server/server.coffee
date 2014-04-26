Accounts.onCreateUser (options, user) ->
  options.profile.avatar = user.services.google.picture
  options.profile.email  = user.services.google.email
  console.log options
  options.profile.room = 0

  return options

Meteor.publish 'user_data', (opts) ->
  if opts
    Meteor.users.update(
      { _id: opts['id'] },
      { $set: { 'profile.room': opts['room'] } }
    )
    this.ready()

