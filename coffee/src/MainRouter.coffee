define ['marionette'], (Marionette) ->
  Marionette.AppRouter.extend
        routes:
          '': 'index'
        index: ->
          console.log 'AppRouter::index()'
          app.goMain()
