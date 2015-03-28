define ['layouts/TopLayout'], (TopLayout) ->
  describe 'TopLayoutモジュール', ->
    describe 'インスタンス生成', ->
      it 'newする', ->
        expect(new TopLayout()).to.exist
      it '初期化処理', ->
        expect((new TopLayout()).initialize).to.exist
