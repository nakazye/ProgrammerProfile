define [
  'marionette'
  'text!templates/MainLayout.html'
  ], (
  Marionette
  MainLayoutTmpl
  ) ->
  Marionette.LayoutView.extend
    initialize: ->
      console.log 'MainLayout::initialize()'
    template: _.template MainLayoutTmpl
    regions:
      contentsRegion: 'contents-region'
