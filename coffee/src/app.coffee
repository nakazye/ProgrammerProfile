define [
  'marionette'
  'layouts/MainLayout'
  ], (
  Marionette
  MainLayout
  ) ->
  window.app = new Marionette.Application
    initialize: ->
      console.log 'app::initialize()'
      @models = {}
      @collections = {}
      @layouts = {}
      @views = {}

    start: ->
      console.log 'app::start()'

      # set main region
      @addRegions
        mainRegion: '#main-region'

      # set main Layout
      @layouts.mainLayout = new MainLayout()
      @getRegion('mainRegion').show(@layouts.mainLayout)

      # set Router
      

      Backbone.history.start
        pushstate: true

    window.app
