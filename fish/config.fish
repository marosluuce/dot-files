if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source "$HOME/.cargo/env.fish"
    source /opt/homebrew/opt/asdf/libexec/asdf.fish

    abbr g git
    abbr vim nvim
    abbr cat "bat -p"
    abbr ls eza
end
