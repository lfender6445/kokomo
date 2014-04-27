Router.configure
  debug: true
  onBeforeAction: ->
  layoutTemplate: 'layout',

Router.map ->
  @route "home",
    path: "/"
    onRun: ->
    onBeforeAction: ->

  # TODO: Why was this needed before but not now?
  #@route "authorization", path: "/_oauth/google?close"
