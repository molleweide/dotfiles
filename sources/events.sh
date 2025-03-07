# =======================================================
# EVENT CALLBACKS
#
# These are functions that the event handler will cal when
# triggered by the trap

# The pid should be added as a subdir here .../$$/events/<queued_event_files>
# ^ Now, we can use [.../$$/events/semaphore]
DOROTHY_STATE_EVENTS_DIR="$XDG_STATE_HOME/dorothy/login_shell_events"

function set_prompt {
  # echo "set_prompt args: [$*]"
  # echo "set_prompt: ACTIVE_POSIX_SHELL == [$ACTIVE_POSIX_SHELL]"
  #
  # note: How to set commandline for various shells
  #         https://duckduckgo.com/?q=bash+set+string+command+line+programmatically&ia=web
  #         https://unix.stackexchange.com/questions/82630/put-text-in-the-bash-command-line-buffer
  #         https://unix.stackexchange.com/questions/111957/is-there-a-way-to-make-a-bash-script-enter-a-certain-keystroke?noredirect=1&lq=1
  #         https://unix.stackexchange.com/questions/731343/command-to-inject-string-into-command-line-like-a-pre-filled-command-to-edit-be
  #         https://unix.stackexchange.com/questions/391679/how-to-automatically-insert-a-string-after-the-prompt?noredirect=1&lq=1
  #         https://unix.stackexchange.com/questions/82630/put-text-in-the-bash-command-line-buffer?noredirect=1&lq=1

  if [ "$ACTIVE_POSIX_SHELL" = "bash" ]; then
    :
  elif [ "$ACTIVE_POSIX_SHELL" = "zsh" ]; then
    print -z "$@"
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

# # Run each event in order
# function queue_flush {
#   while true; do
#     file=$(ls -tr /queue-dir | head -n 1)
#     [ -n "$file" ] && cat "/queue-dir/$file" && rm "/queue-dir/$file"
#     sleep 1 # Avoid busy looping
#   done
# }

function event_handler_queued {
  local callback
  local state_events_file="$DOROTHY_STATE_EVENTS_DIR/$$"

  # echo "Hello from <event handler>"
  #

  # TODO: put the queue reading into its own command [event-read -- $pid]
  # Which ensures to only return after the next queued correct event
  # has been read.

  # TODO: FIFO by reading the oldest file always
  # file=$(ls -tr /queue-dir | head -n 1) # Get oldest file
  # [ -n "$file" ] && cat "/queue-dir/$file" && rm "/queue-dir/$file"

  callback="$(head -n 1 "$state_events_file")"
  local data="$(tail -n +2 "$state_events_file")"

  # echo "events | callback: $callback"
  # echo "events | data: $data"

  case "$callback" in
  'reload_environment') ;;
  'set_prompt') set_prompt "$data" ;;
  esac
}

# trap that captures event.
trap event_handler_queued SIGUSR1

# TODO: login shell cleanup trap -> remove purge $$ events dir
function cleanup {
  :
  # rm -rf "/tmp/state-dir-$$"  # Use $$ (PID of shell) to clean up its state dir
}

trap cleanup EXIT
