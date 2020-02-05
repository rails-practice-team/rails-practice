# README

## 開発環境構築

- http://localhost:3000 (アプリケーション)
- Docker for Mac のinstall
- https://docs.docker.com/docker-for-mac/install/

### 基本的に初回のみ
- docker-compose build

### 毎回
- docker-copmpose up (実行開始時)
- docker-compose stop (実行停止時)

### rails コマンド入力時
- docker-compose run web rails ~~~ ~~~
先頭にdocker-compose run webをつける

### docker-containerに入りたいとき
- docker-compose exec web bash



## 開発注意事項
- branchは基本使い捨て

### local

#### 初回のみ
- git clone git@github.com:rails-practice-team/rails-practice.git

#### issue開始時
- git checkout master (masterbranchに必ず戻る)
- git checkout -b 作業するissue名 (masterbranchで行う)
-> (例) git checkout -b issue12


#### 毎回
- git add .
- git commit -m "コメント(日本語可)"
- git push origin 自分のブランチ名

### github上

- pullrequest発行
- 勝手にマージしない

