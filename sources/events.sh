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

# # Run each event in order
# function queue_flush {
#   while true; do
#     file=$(ls -tr /queue-dir | head -n 1)
#     [ -n "$file" ] && cat "/queue-dir/$file" && rm "/queue-dir/$file"
#     sleep 1 # Avoid busy looping
#   done
# }

# TODO: put the queue reading into its own command [event-read -- $pid]
# Which ensures to only return after the next queued correct event
# has been read.
#
# TODO: FIFO by reading the oldest file always
# file=$(ls -tr /queue-dir | head -n 1) # Get oldest file
# [ -n "$file" ] && cat "/queue-dir/$file" && rm "/queue-dir/$file"
function event_handler_queued {
  local callback data state_events_file="$DOROTHY_STATE_EVENTS_DIR/$$" \
     state_events_pid_queue="$DOROTHY_STATE_EVENTS_DIR/$$/queue" \
     oldest_file \
     oldest_file_path

  oldest_file=$(ls -tr "$state_events_pid_queue" | head -n 1) # Get oldest file

  oldest_file_path="$state_events_pid_queue/$oldest_file"

  # ls -tr "$state_events_pid_queue" | head -n 1

  # echo "oldest_file: [$oldest_file_path]"


  # bat "$oldest_file_path"

  callback="$(head -n 1 "$oldest_file_path")"
  data="$(tail -n +2 "$oldest_file_path")"

  # echo "$callback | $data"

  if declare -F "$callback" >/dev/null 2>&1; then
    # logger "Function [$callback] exists."
    "$callback" "$data"
  else
    logger "Function [$callback] does not exist."
  fi
}

# trap that captures event.
trap event_handler_queued SIGUSR1

# TODO: Move this into core later
# TODO: Instruct user with a way that they can hook into this function.
#       ^ maybe if user defines functions with some prefix, eg. `user_exit__*`
#         and then we can capture all those funcs.
function cleanup {
  : # rm -rf "$DOROTHY_STATE_EVENTS_DIR/$$"  # Use $$ (PID of shell) to clean up its state dir
}

trap cleanup EXIT
