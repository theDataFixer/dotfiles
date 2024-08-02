#    _____      __
#   / __(_)____/ /_
#  / /_/ / ___/ __ \
# / __/ (__  ) / / /
#/_/ /_/____/_/ /_/

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths
set fish_vi_key_bindings                          # Enables vim keyhbinding

set -U fish_greeting
set -gx EDITOR nvim
set -gx PATH $HOME/.cargo/bin $PATH
set -gx OPENAI_API_KEY (pass show api/tokens/openai)
set -gx OPENAI_MODEL "gpt-3.5-turbo"
set -x SHELL /usr/bin/fish

# Set necessary environment variables for gpg
set -gx GPG_TTY (tty)
set -gx GPG_AGENT_INFO /home/tux/.gnupg/S.gpg-agent:0:1

### Setting the starship prompt
if type -q starship
    starship init fish | source
else
end

### Calling external scripts
source ~/.config/fish/completions/aliases.fish
