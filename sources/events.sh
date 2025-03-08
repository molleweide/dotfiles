#
# DOROTHY EVENT SYSTEM
#
# ```
# For commands to eg. communicating back to the parent shell associated
# with the tty.
# ```
#
# USAGE:
# event-trigger --login -- dorothy_prompt_set "$data"
# ^ This will update the shell prompt from within an executable command.
#   It looks for the first parent shell where the executable was ran and
#   then tells the shell to print the data to the cli prompt.
#
#
# =======================================================
# EVENT CALLBACKS
#
# These are functions that the event handler will cal when
# triggered by the trap

# WARN: Are there any security risks in this system?

function logger {
  echo "<[core/events]>: $*"
}

# The pid should be added as a subdir here .../$$/events/<queued_event_files>
# ^ Now, we can use [.../$$/events/semaphore]
DOROTHY_STATE_EVENTS_DIR="$XDG_STATE_HOME/dorothy/login_shell_events"

# TODO: put the queue reading into its own command [event-read -- $pid]
# Which ensures to only return after the next queued correct event
# has been read.
function event_handler_queued {
  local callback data oldest_file oldest_file_path \
    state_events_pid_queue="$DOROTHY_STATE_EVENTS_DIR/$$/queue"

  oldest_file=$(ls -tr "$state_events_pid_queue" | head -n 1) # Get oldest file
  oldest_file_path="$state_events_pid_queue/$oldest_file"

  # Callback could be a comma separated list, which allows me to check if we are
  # supposed to split the data args and call the function with these args.
  callback="$(head -n 1 "$oldest_file_path")"
  data="$(tail -n +2 "$oldest_file_path")"

  # Ensure func is not builtin, which could be exploited maliciously.
  if declare -F "$callback" >/dev/null 2>&1 && ! type "$callback" | grep -q "is a shell builtin"; then
    "$callback" "$data"
  else
    logger "Function [$callback] does not exist OR was a builtin (You can only call pre-defined funcs..)."
  fi
  rm "$oldest_file_path" # regardless if the call succeeded or not, remove the event file.
}

# trap that captures event.
trap event_handler_queued SIGUSR1

# TODO: Move this into core later
# TODO: Instruct user with a way that they can hook into this function.
#       ^ maybe if user defines functions with some prefix, eg. `user_exit__*`
#         and then we can capture all those funcs.
# NOTE: Use fs-rm
function dorothy_shell_on_exit_cleanup {
  local pid=$$
  # # This should ensure no accidental deletions.
  # if [[ "$pid" =~ ^[0-9]+$ ]]; then
  #   rm -rf "/Users/hjalmarjakobsson/.local/state/dorothy/login_shell_events/$pid"
  # else
  #   logger "[dorothy_exit_cleanup]: Process ID $$ is not a valid integer. Aborting."
  # fi
}

trap dorothy_shell_on_exit_cleanup EXIT
