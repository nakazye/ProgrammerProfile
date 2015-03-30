define ['marionette'], (Marionette) ->
  Marionette.AppRouter.extend
    initialize: ->
      console.log 'MainRouter::initialize()'
    routes:
      ''                   : 'index'
      'staruser'           : 'staruser'
      'staruser/:category' : 'staruser'
      'stats'              : 'stats'
      'user/:id'           : 'user'
      'recommend'          : 'recommend'
    index: ->
      console.log 'AppRouter::index()'
      app.goMain()
    stats: ->
      console.log 'AppRouter::stats()'
    staruser: ->
      console.log 'AppRouter::staruser()'
    user: (id) ->
      console.log 'AppRouter::user()'
      console.log 'AppRouter::user args:id ->' + id
    recommend: ->
      console.log 'AppRouter::recommend()'
