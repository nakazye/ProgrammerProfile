require =
  baseUrl: '../'
  paths:
    jquery    : 'lib/js/jquery'
    jqueryui  : 'lib/js/jquery-ui'
    underscore: 'lib/js/underscore'
    backbone  : 'lib/js/backbone'
    marionette: 'lib/js/backbone.marionette'
    babysitter: 'lib/js/backbone.babysitter'
    wreqr     : 'lib/js/backbone.wreqr'
    bootstrap : 'lib/js/bootstrap'

  shim:
    underscore:
      exports: '_'
    jquery:
      exports: '$'
    backbone:
      deps: ["jquery", "underscore"]
      exports: "Backbone"
    marionette:
      deps: ["backbone"]
      exports: "Backbone"
    bootstrap:
      deps: ["jquery"]
