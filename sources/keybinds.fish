# =======================================================
# [FISH] BINDINGS
#
# See `man zshzle` for more info.
# =======================================================
#
# bind [(-M | --mode) MODE] [(-m | --sets-mode) NEW_MODE] [--preset | --user] [-s | --silent] KEYS COMMAND ...
# bind [(-M | --mode) MODE] [--preset] [--user] [KEYS]
# bind [-a | --all] [--preset] [--user]
# bind (-f | --function-names)
# bind (-L | --list-modes)
# bind (-e | --erase) [(-M | --mode) MODE] [--preset] [--user] [-a | --all] | KEYS ...#
#
# Description
# bind manages key bindings.
#
# If both KEYS and COMMAND are given, bind adds (or replaces) a binding in MODE. If only KEYS is given, any existing binding in the given MODE will be printed.
#
# KEYS is a comma-separated list of key names. Modifier keys can be specified by prefixing a key name with a combination of ctrl-, alt- and shift-. For example, pressing w while holding the Alt modifier is written as alt-w. Key names are case-sensitive; for example alt-W is the same as alt-shift-w. ctrl-x,ctrl-e would mean pressing ctrl-x followed by ctrl-e.
#
# Some keys have names, usually because they don’t have an obvious printable character representation. They are:
#
# the arrow keys up, down, left and right,
#
# backspace,
#
# comma (,),
#
# delete,
#
# end,
#
# enter,
#
# escape,
#
# f1 through f12.
#
# home,
#
# insert,
#
# minus (-),
#
# pageup,
#
# pagedown,
#
# space and
#
# tab,
#
# These names are case-sensitive.
#
# An empty value ('') for KEYS designates the generic binding that will be used if nothing else matches. For most bind modes, it makes sense to bind this to the self-insert function (i.e. bind '' self-insert). This will insert any keystrokes that have no bindings otherwise. Non-printable characters are ignored by the editor, so this will not result in control sequences being inserted.
#
# To find the name of a key combination you can use fish_key_reader.
#
# COMMAND can be any fish command, but it can also be one of a set of special input functions. These include functions for moving the cursor, operating on the kill-ring, performing tab completion, etc. Use bind --function-names or see below for a list of these input functions.
#
# Note If a script changes the commandline, it should finish by calling the repaint special input function.
# If no KEYS argument is provided, all bindings (in the given MODE) are printed. If KEYS is provided but no COMMAND, just the binding matching that sequence is printed.
#
# Key bindings may use “modes”, which mimics vi’s modal input behavior. The default mode is “default”. Every key binding applies to a single mode; you can specify which one with -M MODE. If the key binding should change the mode, you can specify the new mode with -m NEW_MODE. The mode can be viewed and changed via the $fish_bind_mode variable. If you want to change the mode from inside a fish function, use set fish_bind_mode MODE.
#
# To save custom key bindings, put the bind statements into config.fish. Alternatively, fish also automatically executes a function called fish_user_key_bindings if it exists.
#
# =======================================================
# https://fishshell.com/docs/current/cmds/bind.html
#
#
# research: insert string into the commandline:
# https://stackoverflow.com/questions/61520166/how-to-create-a-key-binding-that-inserts-text-in-the-fish-shell
# https://askubuntu.com/questions/20024/add-binding-to-fish-that-not-auto-executes-the-string
#
# NOTE: Inserting string at cursor is just a matter of doing `command -i` in the
# defined function it seems.
# Example:
#   bind j,k 'commandline -i foo'
#   or `bind jk`


# Use [od] to expose hidden special chars
# echo -n "$line" | od -A n -t x1

# source "$DOROTHY/sources/fish.fish"
#
#
# # bindkey: list all keybinds
#
#
# function __fish_load_binds {
#
#   local DEBUG="yes"
#
#   __debug_lines(){
#         if (( "$DEBUG" == "yes" )); then
#           __print_lines "::: [sources/keybinds.zsh] :::"
#           __print_lines "$@"
#         fi
#   }
#
#   # If not set, then declaring variables will print them to stdout.
#   # ^ See `man zshbuiltins`
#   setopt TYPESET_SILENT
#
#   local __kb_collector=()
#   local __kb_line_count=0
#
#   dorothy-render-shell-keybinds --shell=zsh | while read -r line; do
#     if ! [[ "$line" == $'\0' ]]; then
#       __kb_collector+=("$line")
#     else
#       # process each grouping when a null delimiter is found.
#       # printf '%s\n' "---------"
#
#       # printf '%s\n' "> [${__kb_collector[1]}]"
#       # printf '%s\n' "> [${__kb_collector[2]}]"
#       # printf '%s\n' "> [${__kb_collector[3]}]"
#
#       local key func_name func_body
#
#       key="${__kb_collector[1]}"
#       func_name="${__kb_collector[2]}"
#       func_body="${__kb_collector[3]}"
#
#       if [[ "$DEBUG" == 'yes' ]] ;then
#         __debug_lines "key: $key" "func_name: $func_name" "func_body: $func_body"
#       fi
#
#       eval "$func_body"
#       eval "zle -N $func_name" # register the name as zle command.
#
#       for m in emacs vicmd viins; do
#         eval "bindkey -M $m '^g^$key' $func_name"
#         eval "bindkey -M $m '^g$key' $func_name"
#       done
#
#       # ------
#
#       __kb_collector=() # reset for next iteration
#     fi
#   done
# }
#
# __fish_load_binds
