define [
  'marionette'
  'collections/MainMenuCollection'
  'views/MainMenuItemView'
  ], (
  Marionette
  MainMenuCollection
  MainMenuItemView
  ) ->
    Marionette.CollectionView.extend
      initialize: ->
        console.log 'MainMenuCollectionView::initialize()'
        @collection = new MainMenuCollection()
        @collection.fetch()
      tagName: 'ul'
      className: 'nav navbar-nav'
      childView: MainMenuItemView
      onShow: ->
        console.log 'MainMenuCollectionView::onShow()'
