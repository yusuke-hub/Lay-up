# 🏠 Noah ~ 備えよう ~
http://13.114.15.249/
[イメージ画像](https://media.istockphoto.com/vectors/noah-and-the-ark-before-great-flood-vector-id1149183486?k=6&m=1149183486&s=612x612&w=0&h=TavYjCxR7LDnjtHq7r9iagGk7oo3QdlCstYt0mULuJ4=)
### 👤 テストユーザー
メールアドレス： test1@test.com  /  パスワード: 111111

# 👀 きっかけ
三賀日に、千葉県で震度４の地震が発生した際、危機感を覚えました。
というのも皆さんご存知の通り、日本では将来、高確率で大地震が発生すると言われているからです。
まして今年はオリンピックで、日本にたくさんの人が集まる年。
もしもの可能性を考えて、非常時に自分と大切な人が身を守る助けとなるような物を作りたいと考え、このアプリを作成しました。

# 💡 主な機能
### 📍 避難先の登録
ユーザーは出発地点と避難先を入力しで、二地点間の距離と時間を参照し、OKであれば、距離と時間の情報と共に避難先を登録できます。

### 👥 グループ作成・招待・参加・退出
ユーザー情報は、グループを作成し、他のユーザーを招待することができます。グループへの参加、退出も可能です。
個人情報保護の観点から、ユーザー情報の公開範囲を同じグループのユーザーのみに制限しました。

# 💡 補助機能
### 🗻標高情報の取得
避難先を選ぶ際に、地震による津波の可能性を考慮できるよう、地点の名称や住所を入力する事で、当該地点の標高情報を参照できるようにしました。

# 🔨 使用技術
- Ruby 2.5.7
- Rails  5.2.4
- mysql2

###  🏋 インフラ
- Nginx
- puma
- AWS(EC2,RDS for MySQL,Elastic IP)

###  🌞 フロントエンド
- SASS, Bootstrap4, fontawsome, jQuery

###  🌝 バックエンド

#####   🛫 API
- Google Maps Javascript API
- Geocoding API
- Places API
- Directions API

#####   🚅 gem
- devise: ユーザー登録・ログイン機能
- kaminari: ページネーション機能
- refile: 画像アップロード
- pry-byebug : デバッグ
- ransack: 検索機能
- rails-i18n: 日本語設定

#####     その他
- グループ作成・招待・参加・退出(nested attribute)
- コメント追加・削除機能(Ajax)
