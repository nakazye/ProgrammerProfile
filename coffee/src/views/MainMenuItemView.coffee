define [
  'marionette'
  'models/MainMenuItemModel'
  'text!templates/MainMenuItemViewTmpl.html'
  ], (
  Marionette
  MainMenuItemModel
  MainMenuItemViewTmpl
  ) ->
    Marionette.ItemView.extend
      initialize: ->
        console.log 'MainMenuItemView::initialize()'
      tagName: 'li'
      model: MainMenuItemModel
      template: _.template MainMenuItemViewTmpl
      ui:
        link: 'a'
      events:
        'click @ui.link': 'clickLink'
      clickLink: (event) ->
        console.log 'MainMenuItemView::clickLink()'
        console.log 'navigate-> ' + @model.get('path')
        app.router.navigate @model.get('path'), {trigger: true}
        event.preventDefault() # これがないと/hoge#みたいなURLになってしまう(hrefのURLが発動してしまう)
