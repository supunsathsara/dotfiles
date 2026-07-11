# Dotfiles

Personal dotfiles for macOS (M5 Mac). Branches track different machines:
- **`main`** — current/latest setup (M5 Mac)
- **`m1`** — old Intel Mac config (Android SDK, Java 17, Bun, Flutter)

## What's Inside?

- `.zshrc` — Zsh config with Powerlevel10k prompt, NVM, pnpm, Homebrew Ruby
- `.p10k.zsh` — Powerlevel10k theme (classic, 2-line, Nerd Font icons)
- `.zprofile` — Login shell: Homebrew, Python 3.12
- `install.sh` — Symlinks dotfiles into `~/`

## Install

```bash
./install.sh
# or manually:
ln -s ~/Dev/dotfiles/.zshrc ~/.zshrc
ln -s ~/Dev/dotfiles/.zprofile ~/.zprofile
ln -s ~/Dev/dotfiles/.p10k.zsh ~/.p10k.zsh
```
