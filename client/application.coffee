Deps.autorun ->
  Template.user.profile_picture = ->
    console.log 'autorun'
    if Meteor.user()
      Meteor.user().services.google.picture

if Meteor.isClient
  Template.hello.greeting = ->
    "Welcome to kokomo."

  Template.hello.events "click input": ->
    # template data, if any, is available in 'this'
    console.log "You pressed the button"  if typeof console isnt "undefined"
    return

  Template.user.profile_picture = ->
    if Meteor.userId()
      Meteor.user().services.google.picture


  #Template.user.profile_picture = ->
 #   'http://dsaffsd'
    #Meteor.subscribe('user').ready ->
    #  console.log Meteor.user().services.google.picture
