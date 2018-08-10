set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set fish_greeting ""

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

function run_gpg-agent
  if [ -x /usr/local/bin/gpg-agent ]
    set -l GPGINFO ~/.gpg-agent.info
    if not pgrep -u $USER gpg-agent >/dev/null ^&1
      gpg-agent --daemon --write-env-file $GPGINFO >/dev/null
      chmod 600 $GPGINFO
    end
    if [ -f $GPGINFO ]
      for l in (cat $GPGINFO)
        set -gx (echo $l | cut -d= -f1) (echo $l | cut -d= -f2)
      end
    else
      echo 'ERROR: gpg-agent info file not found'
    end
  else
    echo 'WARN: gpg-agent not found/installed'
  end
end

run_gpg-agent
set -gx GPG_TTY (tty)

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
set -g fish_user_paths "/usr/local/opt/gpg-agent/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

source /usr/local/opt/asdf/asdf.fish

eval (direnv hook fish)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/nkw/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/nkw/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/nkw/.config/yarn/global/node_modules/tabtab/.completions/sls.fish ]; and . /Users/nkw/.config/yarn/global/node_modules/tabtab/.completions/sls.fish

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
