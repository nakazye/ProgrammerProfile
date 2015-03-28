define ['app'], (app) ->
  describe 'appモジュール', ->
    describe 'インスタンス生成', ->
      it 'requireJSによるインスタンス生成', ->
        expect(app).to.exist
      it 'Marionette.Applicationの派生である', ->
        expect(app).to.be.an.instanceof(Marionette.Application)
    describe '初期化処理', ->
      it 'initialize', ->
        expect(app.initialize).to.exist
      it 'this.models', ->
        expect(app.models).to.eql({})
      it 'this.collections', ->
        expect(app.collections).to.eql({})
      it 'this.layouts', ->
        expect(app.layouts).to.eql({})
      it 'this.views', ->
        expect(app.views).to.eql({})
      it 'this.router', ->
        expect(app.router).to.eql({})
      it 'add Region', ->
        expect(app.getRegion('mainRegion'))
    describe '処理実施', ->
      it 'スタート実施', ->
        expect(app.start).to.exist
        window.app.start()
      it 'router生成', ->
        expect(app.router).to.be.instanceof(Marionette.AppRouter)
        
