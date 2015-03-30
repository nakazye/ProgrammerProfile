define ['backbone'], (Backbone) ->
  Backbone.Model.extend
    initialize: ->
      console.log 'MainMenuItemModel::initialize()'
    default:
      'name': 'name'
      'path': 'path'
