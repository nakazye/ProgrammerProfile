define ['MainRouter'], (MainRouter) ->
  describe 'MainRuterモジュール', ->
    describe 'インスタンス生成', ->
      it 'newする', ->
        expect(new MainRouter()).to.exist
