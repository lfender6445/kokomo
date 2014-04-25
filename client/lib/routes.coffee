Router.configure
  debug: true
  onBeforeAction: ->
  layoutTemplate: 'application',

Router.map ->
  @route "home",
    path: "/"
    onRun: ->
    onBeforeAction: ->

  @route "authorization",
    path: "/_oauth/google?close"
