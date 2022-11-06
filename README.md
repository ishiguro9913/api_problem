# README

## 株式会社iimon様 技術試験　サーバーサイド　A問題　提出物

Ruby on Railsにて作成しました。
ご確認お願いいたします。

以下問題文

Django / Ruby on Rails / Laravel / Spring framework / Play Frameworkのどれかを使用してPOST(application/json)で下記情報を受け取ってitemsテーブルに保存するAPIを作成してください。

<blockquote>
{  

  "name": "apple",  
  "price": 200  
}
</blockquote>

## ローカルでの実行方法

コードのクローンをしてください
```
$ git clone https://github.com/ishiguro9913/api_problem
$ cd api_problem
```

gemをインストールしてください
```
$ bundle install
```

データベースを作成してください
```
$ rails db:create
$ rails db:migrate
```

Railsを立ち上げてください
```
$ rails s
```

サーバーを立ち上げた状態で、別のターミナルから以下のPOST処理を行ってください
```
curl -X POST -H "Content-Type: application/json" -H "Origin: http://localhost:8080" -d '{"name":"apple", "price":200}' localhost:3000/api/items
```

以下の文字列が返ってきたら保存成功です
```
{"status":"OK"}%
```

コンソールを立ち上げて
```
rails c
```
直近に保存されたレコードを確認できます
```
irb(main):001:0> Items.last
```
```
Item Load (0.5ms)  SELECT  "items".* FROM "items" ORDER BY "items"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Item id: 9, name: "apple", price: 200, created_at: "POSTした時刻が入る", updated_at: "POSTした時刻が入る">
```

※動作確認環境  
macOS Big Sur バージョン 11.4  
Google Chrome バージョン 107.0.5304.87