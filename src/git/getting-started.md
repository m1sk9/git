# Git を始める

## Git のインストール

Git をインストールする方法はいくつかあります. 自分が使っている OS に合わせてインストール方法を選んでください.

### Windows

- Windows で Git を使用する際は [Git for Windows](https://gitforwindows.org/) を使うのが一般的です.
- `winget` を使ってインストールすることもできます.

  ```sh
  winget install --id Git.Git -e --source winget 
  ```

### macOS

- macOS で Git を使用する際は [Homebrew](https://brew.sh/) を使ってインストールするのが一般的です.

  ```sh
  brew install git
  ```

- [MacPorts](https://www.macports.org/) を使ってインストールすることもできます.

  ```sh
  sudo port install git
  ```

### Linux / Unix

OS によって方法が異なります. 詳しくは [公式サイトのダウンロードページ](https://git-scm.com/download/linux) を参照してください.

- Debian / Ubuntu: `apt-get install git`
- Arch Linux: `pacman -S git`

## Git の設定

### 設定の主従関係

Git には `git config` コマンドを使って設定を行う事ができますが, これらの設定は次の場所に保存されます (これは macOS / Linux の場合です).

1. `/etc/gitconfig`: システム全体に適用される設定
2. `~/.gitconfig` または `~/.config/git/config`: ユーザーごとに適用される設定
3. `.git/config` (リポジトリ内にある): リポジトリごとに適用される設定

これらのレベルの値は `1` から `3` の間で優先順位を持っています. (つまり `3` の `.git/config` に書かれた設定が最も優先されます)

### ユーザー名とメールアドレスの設定

Git をインストールしたら, まず最初にユーザー名とメールアドレスを設定する必要があります. これはコミット時に使用される情報です.

```sh
git config --global user.name "Your Name"
git config --global user.email <Your Email>
```

> [!TIP]
>
> 筆者 **Sho Sakuma** の場合は以下のように設定します.
>
> ```sh
> git config --global user.name "Sho Sakuma"
> git config --global user.email me@m1sk9.dev
> ```

Git においてこのユーザー名とメールアドレスは非常に大切なものになります. これらの情報は Git のコミット情報として永久的に保存され, GitHub はこれらの情報を使ってコミットを識別します.

`me@m1sk9.dev` は [m1sk9](https://github.com/m1sk9) という GitHub アカウントに登録されたメールアドレスです. GitHub は `me@m1sk9.dev` というメールアドレスを使ったコミットを全て m1sk9 というユーザーに紐付けます.

逆にここで設定したメールアドレスが GitHub のアカウントに登録されていない場合, GitHub はそのコミットを無効として扱います.

> [!TIP]
>
> これらの仕組みを悪用することで **コミット偽装** が可能になります.
> 気になる人は以下の記事を読んでみてください. (この記事内の対策については付録で説明します)
>
> [Git でコミット作成者を偽装する方法／署名付きコミットでの対策　- Qiita](https://qiita.com/s6n/items/bb869f740a53a3bf169e)
