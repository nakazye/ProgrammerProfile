define ['marionette'], (Marionette) ->
  window.app = new Marionette.Application(
    initialize:  ->
      console.log 'app::initialize()'
  )
