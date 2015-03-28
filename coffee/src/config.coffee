window.require =
  baseUrl: '/static/js/'
  paths:
    text                  : '../lib/js/text'
    jquery                : '../lib/js/jquery'
    jqueryui              : '../lib/js/jquery-ui'
    underscore            : '../lib/js/underscore'
    backbone              : '../lib/js/backbone'
    marionette            : '../lib/js/backbone.marionette'
    'backbone.wreqr'      : '../lib/js/backbone.wreqr'
    'backbone.babysitter' : '../lib/js/backbone.babysitter'
    bootstrap             : '../lib/js/bootstrap'
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
      exports: "Marionette"
    bootstrap:
      deps: ["jquery"]
