define [
  'backbone'
  'models/MainMenuItemModel'
  ], (
  Backbone
  MainMenuItemModel
  ) ->
  Backbone.Collection.extend
    initialize: ->
      console.log 'MainMenuCollection::initialize()'
    url: '/api/mainMenu'
    model: MainMenuItemModel
    
