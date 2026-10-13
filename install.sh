#!/bin/sh
# Idempotent installer: symlinks each config from this repo into $HOME.
# Existing files are moved aside with a dated suffix first. Nothing is ever
# overwritten in place.

set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)
stamp=$(date +%Y%m%d-%H%M%S)
backups=0

link_one() {
    name=$1
    src=$repo_dir/$name
    dst=$HOME/$name

    if [ ! -f "$src" ]; then
        printf 'missing in repo, skipping: %s\n' "$name"
        return 0
    fi

    # Already linked to this repo: nothing to do.
    if [ -L "$dst" ] && [ "$src" = "$(readlink "$dst")" ]; then
        printf 'already linked: %s\n' "$name"
        return 0
    fi

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        backup=$dst.backup-$stamp
        if [ -e "$backup" ]; then
            printf 'refusing to touch %s: backup %s already exists\n' "$name" "$backup"
            return 1
        fi
        mv "$dst" "$backup"
        backups=$((backups + 1))
        printf 'backed up %s as %s\n' "$name" "$(basename "$backup")"
    fi

    ln -s "$src" "$dst"
    printf 'linked %s\n' "$name"
}

for config in .zshrc .gitconfig .editorconfig .vimrc; do
    link_one "$config"
done

if [ "$backups" -gt 0 ]; then
    printf 'done, %s backup(s) created with suffix .backup-%s\n' "$backups" "$stamp"
else
    printf 'done, no backups needed\n'
fi
