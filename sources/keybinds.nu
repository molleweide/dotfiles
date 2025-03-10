# =======================================================
# [NU] BINDINGS
#
# See `man zshzle` for more info.
# =======================================================
#
# =======================================================
# LINKS:
# https://www.nushell.sh/commands/docs/keybindings.html
# https://www.nushell.sh/book/line_editor.html#multi-line-editing
#
# https://www.nushell.sh/blog/2024-12-04-configuration_preview.html
#
# For more information on input and keybindings, check: https://www.nushell.sh/book/line_editor.html
#
# =======================================================
# NU SHELL: CONFIGURE KEYBINDS
#
# EXAMPLE1;
#
#     $env.config.keybindings = (
#         $env.config.keybindings
#         | append {
#             name: reload_config
#             modifier: none
#             keycode: f5
#             mode: vi_insert
#             event: {
#                 send: executehostcommand,
#                 cmd: $"source '($nu.config-path)'"
#             }
#         }
#         | append {
#             name: reload_config
#             modifier: none
#             keycode: f5
#             mode: vi_normal
#             event: {
#                 send: executehostcommand,
#                 cmd: $"source '($nu.config-path)'"
#             }
#         }
#     )



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

