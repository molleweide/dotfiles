# =======================================================
# EVENT CALLBACKS
#
# These are functions that the event handler will cal when
# triggered by the trap

# NOTE: How to set commandline for various shells
# https://duckduckgo.com/?q=bash+set+string+command+line+programmatically&ia=web
# ----
# https://unix.stackexchange.com/questions/82630/put-text-in-the-bash-command-line-buffer
# https://unix.stackexchange.com/questions/111957/is-there-a-way-to-make-a-bash-script-enter-a-certain-keystroke?noredirect=1&lq=1
# https://unix.stackexchange.com/questions/731343/command-to-inject-string-into-command-line-like-a-pre-filled-command-to-edit-be
# https://unix.stackexchange.com/questions/391679/how-to-automatically-insert-a-string-after-the-prompt?noredirect=1&lq=1
# https://unix.stackexchange.com/questions/82630/put-text-in-the-bash-command-line-buffer?noredirect=1&lq=1
# ----
function set_prompt {

  # INFO: The ACTIVE_SHELL variable should be available

  echo "set_prompt: ACTIVE_POSIX_SHELL == $ACTIVE_POSIX_SHELL"

  if [ "$ACTIVE_POSIX_SHELL" == "bash" ] ; then
    :
  elif [ "$ACTIVE_POSIX_SHELL" == "zsh" ] ; then
    :
  else
    echo "setting prompt is not supported for other shells than [bash] or [zsh]"
  fi
}

# =======================================================
# TRIGGER EVENT
#
# Use [event-trigger] to trigger events

# =======================================================
# TRAP AND EVENT HANDLER
#
#
# NOTE:
# - Dorothy writes the PID for each shell to the <NAME> in a state file <F>
# --------------------------------------------
# - Then, F can be used to write callback data to when using [event-trigger] so
# that users can communicate back to login shells from commands.
# --------------------------------------------
# - Dorothy uses an EXIT trap that cleans up each respective state file on shutdown.
#   [trap clean_up EXIT]
# --------------------------------------------
#
# WARN: For security reasons, should not be able to run arbitrary code.
# There are security implications here that needs to be dealt with. But
# Ben said something about checking for builtins in the alias.
#

function event_handler {
  echo "Hello from <event handler>"

  # read state data
  local callback="$(cat "state file" | echo "head -> callback func")"
  local data="$(cat "stat file" | echo "tail -> test to insert into prompt")"

  case "$callback" in
    reload_environment) ;;
    set_prompt) set_prompt "$data" ;;
  esac
}

# trap that captures event.
trap event_handler SIGUSR1
