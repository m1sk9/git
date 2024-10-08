# Git チートシート

〇〇をしたいがどうすればできる という時に使えるチートシートです.

CLI での操作を中心にまとめています.

## コミット

### 全てのファイルをステージングする

全てのファイルをステージングします. (慣れていない場合はオススメしません)

```sh
git add .
```

### 空コミットを生成する

テストなどでファイルの変更がないが, コミットを行いたい場合に使用します.

```sh
git commit --allow-empty -m "Empty commit"
```

### 直前のコミットを修正する

直前のコミットメッセージを修正します.

```sh
git commit --amend
```

### 直前のコミットを取り消す

直前のコミットを取り消します.

```sh
git reset --soft HEAD^
```

### 直前のコミットを取り消して, 変更を破棄する

直前のコミットを取り消して, 変更を破棄します.

[上のコマンド](#直前のコミットを取り消す) では取り消すだけですが, このコマンドは変更自体をなかったことにします (つまりファイルがもとに戻ります)

```sh
git reset --hard HEAD^
```

## プッシュ

### 強制的にプッシュする

リモートリポジトリに強制的にプッシュします. rebase などと組み合わせることで特定の履歴を削除しつつ修正できますが, その履歴であるブランチのコミット履歴を破壊します. (歴史破壊とも言います)

```sh
git push -f
```

> [!CAUTION]
>
> 履歴が破壊されることで `git pull` 時にログがすべてクリアされ他の人が混乱してしまうため, 自分が何しているのかわかっていない場合は使うべきではありません.
