define [
  'marionette'
  'layouts/MainLayout'
  'layouts/TopLayout'
  'MainRouter'
  ], (
  Marionette
  MainLayout
  TopLayout
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

      # prepare Layout
      @layouts.mainLayout = new MainLayout()
      @layouts.topLayout = new TopLayout()

      # set main region
      @addRegions
        mainRegion: '#main-region'

      # set main Layout
      @getRegion('mainRegion').show(@layouts.mainLayout)

      # set Router
      @router = new MainRouter()

      Backbone.history.start
        pushstate: true

    goMain: ->
      console.log 'app::goMain()'
      @layouts.mainLayout.getRegion('contentsRegion').show(@layouts.topLayout)
      

    window.app
