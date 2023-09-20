#!/bin/bash
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

echo "Xcodeをインストールします..."
xcode-select --install

#------------------------------------------
# シンボリックリンク
#------------------------------------------
# 配置したい設定ファイル
DOT_FILES=(.zshrc .gitconfig)

# .zshrc という設定ファイルのシンボリックリンクをホームディレクトリ直下に作成する
for file in "${DOT_FILES[@]}"; do
        ln -svf "Dotfiles-v2/${file}" ~/
done

exec $SHELL -l

#------------------------------------------
# homebrew(arm64
#------------------------------------------
echo "homebrewをインストールします..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "brew doctorを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew doctor

echo "brew updateを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew update --verbose

echo "brew upgradeを実行します..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew upgrade --verbose

echo "rosettaをインストールします..."
sudo softwareupdate --install-rosetta

echo ".Brewfileで管理しているアプリケーションをインストールします..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 && brew bundle --file ./.Brewfile --verbose

echo "brew cleanupを実行します..."
which brew >/dev/null 2>&1 && brew cleanup --verbose


#------------------------------------------
# volta & node & npm & yarn & pnpm & bun
#------------------------------------------
echo "voltaをインストールしています..."
curl https://get.volta.sh | bash

echo "voltaよりnodeをインストールしています..."
volta install node

echo "voltaよりnpmをインストールしています..."
volta install npm

echo "voltaよりyarnをインストールしています..."
volta install yarn

echo "voltaよりpnpmをインストールしています..."
volta install pnpm

echo "bunをインストールしています..."
curl -fsSL https://bun.sh/install | bash

#------------------------------------------
# macos
#------------------------------------------
chmod +x ./macos/setup.sh
./macos/setup.sh
