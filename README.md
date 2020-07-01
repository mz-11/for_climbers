## For Climbers　
##### <概要>
クライミングを趣味とする人々のための、実力可視化サービス。<br>
https://desolate-brushlands-08978.herokuapp.com/<br>
- 作成した課題の投稿や挑戦した課題の自己評価ができます。<br>
- 評価が蓄積すると、ユーザーの得意不得意がカテゴリー別にレーダーチャートで可視化される。<br>
- 今の実力を知りたい初心者から苦手を克服したい上級者クライマーまで楽しむことができる、アプリです。<br>

##### <機能・使用技術>
- Ruby
- Ruby on Rails
  - RSpecでテスト記述
  - CRUD機能
    - ユーザー登録機能、投稿一覧表示/詳細/編集/削除機能
  - Sessionを用いたログイン/ログアウト機能
  - 課題投稿機能
  - 画像ファイルアップロード機能(CarrierWave https://github.com/carrierwaveuploader/carrierwave)
  - 5段階評価機能
  - 評価レーダーチャート表示機能（グラフ描画ライブラリchart.js https://www.chartjs.org) 
  - モデルの関連付け
- jQuery
- cloud9
- Heroku
- Bootstrap
- MySQL
