# onvo dotfiles

# terminal settings

install `wezterm` termninal emulator.

```bash
brew install --cask wezterm # macos

sudo apt update & sudo apt install wezterm # linux

scoop bucket add extras # window
scoop install wezterm
```

create `.config/wezterm/wezterm.lua` config file

```bash
cp -r .config/wezterm/ ~/.config/wezterm
```

install `starship`

```powershell
scoop install starship
```

```bash
curl -sS https://starship.rs/install.sh | sh // macos
apt install starship // ubuntu/debain
```

install `Nerd Font`

[Maple Mono NF CN](https://font.subf.dev/zh-cn/download/) | [firaMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip)

create `starship.toml` file.

window: 

```powershell
Invoke-Item $profile // edit profile
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml" // $HOME => C:\\Users\\onvo
```

macos / linux

```bash
mkdir -p ~/.config && touch ~/.config/starship.toml
```

Catppuccin Powerline Preset

```bash
starship preset catppuccin-powerline -o ~/.config/starship.toml
```

---

install `uv`

linux / macos

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh

wget -qO- https://astral.sh/uv/install.sh | sh

curl -LsSf https://astral.sh/uv/0.7.12/install.sh | sh
```

window

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

---

install `fnm`

```bash
curl -fsSL https://fnm.vercel.app/install | bash // macos / linunx
scoop install fnm // window
```
