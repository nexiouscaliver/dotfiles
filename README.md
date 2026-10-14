# dotfiles

My personal terminal setup: zsh, git, editor defaults, and a small installer
that symlinks everything into the home directory. It is a starting point I
keep tidy, not a full setup.

## What is inside

- `.zshrc`: history settings, a clean prompt with the git branch, a handful of daily aliases
- `.gitconfig`: identity plus the defaults I like, main branch, simple push
- `.editorconfig`: consistent basics for any editor that reads it
- `.vimrc`: sane vim defaults for quick edits
- `install.sh`: idempotent installer, plain POSIX sh, no dependencies

## Install

    git clone https://github.com/nexiouscaliver/dotfiles ~/dotfiles
    ~/dotfiles/install.sh

Any existing file is moved aside with a `.backup-YYYYMMDD-HHMMSS` suffix
before the symlink is created, so nothing gets overwritten. Running the
installer again is safe: files already linked to this repo are left alone.

- Site: https://shahilkadia.me
- GitHub: https://github.com/nexiouscaliver
