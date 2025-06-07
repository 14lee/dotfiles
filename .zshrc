# install zsh
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
# macos: brew install zsh
#        chsh -s $(which zsh)
# linux: apt update && apt upgrade 
#        apt install zsh
#        chsh -s zsh

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

# startship settings
eval "$(starship init zsh)"

# fnm
FNM_PATH="/root/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/root/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# clash proxy settings
proxy() {
    export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897
    echo "✅ Clash 代理已开启！"
}

unproxy() {
    unset http_proxy
    unset https_proxy
    unset all_proxy

    echo "❌ Clash 代理已关闭！"
    # 确认所有代理变量是否已清除
    if ! env | grep -qi 'proxy'; then
        echo "   所有代理环境变量已清除。"
    else
        echo "   注意：部分代理环境变量可能未完全清除，请手动检查。"
        env | grep -i 'proxy'
    fi
}

# restart dns caches
flush_dns() {
    sudo resolvectl flush-caches
    echo "✅ DNS缓存已清理"
}

# show wsl ip
function showip() {
    local wsl_ip=$(ip route show | grep -i default)
    echo "$wsl_ip"
}

# python uv setting
. "$HOME/.local/bin/env"

eval "$(uvx --generate-shell-completion zsh)"

# corepack registry
export COREPACK_NPM_REGISTRY=https://registry.npmmirror.com