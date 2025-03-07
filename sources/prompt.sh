#
# PROMPT HELPERS
#

# TODO: Make prettier output for non-supported cases.
#
# TODO: Try printing multiple lines to the prompt. Will this work with [zsh]?
#
function dorothy_prompt_set {
  if [ "$ACTIVE_POSIX_SHELL" = "bash" ]; then
    if is-mac; then
      # On macos, for bash, we need to use an osascript hack
      echo "Inserting chars to CLI prompt is unfortunately not possible with [bash] on [macos]."
    else
      # note: fzf wiki page has solutions for inserting text with bash on linux.
      # ^ https://github.com/junegunn/fzf/wiki/examples#with-write-to-terminal-capabilities
      # note: here is a similar super hacky solution with python
      # ^ https://unix.stackexchange.com/questions/731343/command-to-inject-string-into-command-line-like-a-pre-filled-command-to-edit-be
      echo "Inserting chars to CLI prompt is todo..."
    fi
    echo "The input to [dorothy_prompt_set] is printed below:"
    echo "$@"
  elif [ "$ACTIVE_POSIX_SHELL" = "zsh" ]; then
    print -z "$@"
  else
    echo "Setting prompt is not supported for other POSIX shells than [bash] or [zsh]"
    echo "The input to [dorothy_prompt_set] is printed below:"
    echo "$@"
  fi
}
