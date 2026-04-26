fish_add_path /opt/homebrew/bin

function fish_greeting
end

set -gx EDITOR nvim
set -gx VISUAL nvim

source ~/.config/fish/aliases.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end
