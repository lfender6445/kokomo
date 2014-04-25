Router.configure
  debug: true
  onBeforeAction: ->

Router.map ->
  @route "home",
    path: "/"
    onRun: ->
    onBeforeAction: ->
    template: 'application'

  @route "authorization",
    path: "/_oauth/google?close"
