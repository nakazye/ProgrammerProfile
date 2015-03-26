define ['marionette'], (Marionette) ->
  window.app = new Marionette.Application
    initialize: ->
      console.log 'app::initialize()'
      @models = {}
      @collections = {}
      @regions = {}
      @layouts = {}
      @views = {}

    start: ->
      console.log 'app::start()'
     

      Backbone.history.start
        pushstate: true

