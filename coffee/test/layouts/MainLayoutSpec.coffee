define ['layouts/MainLayout'], (MainLayout) ->
  describe 'MainLayoutモジュール', ->
    describe 'インスタンス生成', ->
      it 'newする', ->
        expect(new MainLayout()).to.exist
      it '初期化処理', ->
        expect((new MainLayout()).initialize).to.exist
