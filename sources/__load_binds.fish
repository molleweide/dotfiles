# if [[ -n "${FISH_VERSION:-}" ]]; then
#
# # FIX: Because `fish` is not posix, this file cant be sourced in fish, and
# # therefore we are required to split this into multiple files, so that you
# # can define user keybinds separately.
#
#   __fzf_git_init() {
#     # https://fishshell.com/docs/current/cmds/bind.html
#     #
#     # I need to just read through this doc so that we can add this shit
#     # for fish and then have that stuff made for ben later.
#     __debug_lines "fish shell is not supported yet."
#
#     # # bind \cd 'exit'
#     # local o c
#     # for o in "$@"; do
#     #   # local fish_bind_func_handle="fzf-git-$o-widget"
#     #   local fish_bind_func_handle="_fzf_git_$o"
#     #   c=${o:0:1}
#     #   bind "\cg\c$c" "$fish_bind_func_handle"
#     #   # bind -m emacs-standard '"\C-g\C-'$c'": " \C-u \C-a\C-k`_fzf_git_'$o'`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
#     #   # bind -m vi-command     '"\C-g\C-'$c'": "\C-z\C-g\C-'$c'\C-z"'
#     #   # bind -m vi-insert      '"\C-g\C-'$c'": "\C-z\C-g\C-'$c'\C-z"'
#     #   # bind -m emacs-standard '"\C-g'$c'":    " \C-u \C-a\C-k`_fzf_git_'$o'`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
#     #   # bind -m vi-command     '"\C-g'$c'":    "\C-z\C-g'$c'\C-z"'
#     #   # bind -m vi-insert      '"\C-g'$c'":    "\C-z\C-g'$c'\C-z"'
#     # done
#   }
# fi
