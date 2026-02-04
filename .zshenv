#!/usr/bin/env zsh
# .zshenv: Zsh environment file. Gets is loaded for every kind of shell session.
# ------------------------------------------------------------------------------

# Set up XDG base directories.
# Spec: https://specifications.freedesktop.org/basedir-spec/latest/index.html
# ------------------------------------------------------------------------------

if [[ $(uname) == "Linux" ]]; then
  export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
  export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
  export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
  export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
  # XDG_RUNTIME_DIR already set by elogind

  ## Make sure directories actually exist
  xdg_dirs=("$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME")
  for dir in "${xdg_dirs[@]}"; do
    if [[ ! -d "$dir" ]]; then
      mkdir -p "$dir"
    fi
  done

  # Set $ZDOTDIR here. All other Zsh related configuration happens there.
  # ------------------------------------------------------------------------------
  export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
  export EDITOR="vim"
elif [[ $(uname) == "Darwin" ]]; then
  export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
else
fi


# Default Apps
# export EDITOR="nvim"
# export VISUAL="code"
# export PAGER="less"
# export EDITOR="vim"

# Exported variables
# export MOZ_ENABLE_WAYLAND=1
export TERM=screen-256color

# export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"
# . "$HOME/.cargo/env"
