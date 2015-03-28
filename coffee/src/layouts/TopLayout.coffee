define [
  'marionette'
  'text!templates/TopLayout.html'
  ], (
  Marionette
  TopLayoutTmpl
  ) ->
  Marionette.LayoutView.extend
    initialize: ->
      console.log 'TopLayout::initialize()'
    template: _.template TopLayoutTmpl
    regions: {}
