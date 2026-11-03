#!/usr/bin/env sh
# Run from .tmux.conf before TPM loads. Idempotent.
#  1. install TPM itself if missing
#  2. install any plugins declared with @plugin (incl. submodules)
#  3. link tracked plugin configs into the (gitignored) plugin dirs
P="$HOME/.tmux/plugins"
[ -d "$P/tpm" ] || git clone --depth 1 https://github.com/tmux-plugins/tpm "$P/tpm"
"$P/tpm/bin/install_plugins" >/dev/null 2>&1
# tmux-which-key reads config.yaml from its own dir; keep the real one in dotfiles
if [ -d "$P/tmux-which-key" ]; then
  ln -sfn "$HOME/.tmux/which-key.yaml" "$P/tmux-which-key/config.yaml"
fi
