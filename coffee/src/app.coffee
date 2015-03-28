define [
  'marionette'
  'layouts/MainLayout'
  'MainRouter'
  ], (
  Marionette
  MainLayout
  MainRouter
  ) ->
  window.app = new Marionette.Application
    initialize: ->
      console.log 'app::initialize()'
      @models = {}
      @collections = {}
      @layouts = {}
      @views = {}
      @router = {}

    start: ->
      console.log 'app::start()'

      # set main region
      @addRegions
        mainRegion: '#main-region'

      # set main Layout
      @layouts.mainLayout = new MainLayout()
      @getRegion('mainRegion').show(@layouts.mainLayout)

      # set Router
      @router = new MainRouter()

      Backbone.history.start
        pushstate: true

    window.app
