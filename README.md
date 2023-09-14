**起動方法**
1, gem をインストールします。
bundle install

2,サーバーを立ち上げます。
rails s

- サーバーが立ち上がらなかった場合は、ruby のバージョンの確認を行ってください
  ruby 3,2,0 で行っているのでローカルのバージョンを合わせてください。

- レスポンスが返ってこない場合、エラーになる場合
  API_KEYを取得し、controllerの#{ENV['API_KEY']}に直接入れてみてください。
  API_KEY取得は、こちらから -> https://webservice.recruit.co.jp/doc/hotpepper/reference.html
