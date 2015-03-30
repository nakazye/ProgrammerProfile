define [
  'marionette'
  'text!templates/MainLayout.html'
  'views/MainMenuCollectionView'
  ], (
  Marionette
  MainLayoutTmpl
  MainMenuCollectionView
  ) ->
  Marionette.LayoutView.extend
    initialize: ->
      console.log 'MainLayout::initialize()'
    template: _.template MainLayoutTmpl
    regions:
      mainMenuRegion: '#mainMenu-region'
      contentsRegion: '#contents-region'
    ui:
      brand: '.navbar-brand'
    events:
      'click @ui.brand': 'clickBrand'
    onShow: ->
      console.log 'MainLayout::onShow()'
      menuView =  new MainMenuCollectionView()
      @getRegion('mainMenuRegion').show(menuView)
    clickBrand: (event)->
      console.log 'MainLayout::clickLink()'
      console.log 'navigate-> /'
      app.router.navigate '/', {trigger: true}
      event.preventDefault() # これがないと/hoge#みたいなURLになってしまう(hrefのURLが発動してしまう)

