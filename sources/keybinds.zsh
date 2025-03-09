# =======================================================
# [ZSH] BINDINGS
#
# See `man zshzle` for more info.
# =======================================================

source "$DOROTHY/sources/zsh.zsh"

DEBUG="yes"

__debug_lines(){
      if (( "$DEBUG" == "yes" )); then
        __print_lines "::: [sources/keybinds.zsh] :::"
        __print_lines "$@"
      fi
}

# =======================================================

# bindkey: list all keybinds

# TODO: ( ) use `echo-join` instead and remove this.
__join_keybind_output_for_prompt_injection() {
  local line
  while read line; do
    echo -n "${(q)line} "
  done
}

__dorothy_zsh__generate_keybinds() {


  local m o
  for o in "$@"; do
    local key="${o:0:1}"
    local picker_name="${o:2}"
    local zsh_bind_func_handle="fzf-git-$picker_name-widget"
    local fzf_action="fzf-helper $picker_name"
    local eval_str__zsh_create_func_handle="$zsh_bind_func_handle() { local result=\$($fzf_action | __join_keybind_output_for_prompt_injection); echo \"\${result[@]}\"; zle reset-prompt; LBUFFER+=\$result }"
    eval "$eval_str__zsh_create_func_handle"

    # zle -N widget [ function ]
    #        Create a user-defined widget.  If there is already a widget with
    #        the specified name, it is overwritten.  When the new widget is
    #        invoked from within the editor, the specified shell function is
    #        called.  If no function name is specified, it defaults to the
    #        same name as the widget.  For further information, see the
    #        section `Widgets' below.
    eval "zle -N $zsh_bind_func_handle" # what is the zle command?

     # See the section `Zle Builtins' in zshzle(1). -> ZLE BUILTINS
     #
     # Notice that we bind both the sequence with all ctrl chars, and also
     # the first one being a ctrl leader and then the char.
    for m in emacs vicmd viins; do
      eval "bindkey -M $m '^g^$key' $zsh_bind_func_handle"
      eval "bindkey -M $m '^g$key' $zsh_bind_func_handle"
    done
  done
}

# function __dorothy_zsh__generate_keybinds_2() {
#   while read -r line; do
#     echo "line: $line"
#   done
# }

# =======================================================
# MAKE BINDINGS
#

# zle -N widget [ function ]
#        Create a user-defined widget.  If there is already a widget with
#        the specified name, it is overwritten.  When the new widget is
#        invoked from within the editor, the specified shell function is
#        called.  If no function name is specified, it defaults to the
#        same name as the widget.  For further information, see the
#        section `Widgets' below.

# Use [od] to expose hidden special chars
# echo -n "$line" | od -A n -t x1

function __zsh_load_binds {

  # If not set, then declaring variables will print them to stdout.
  # ^ See `man zshbuiltins`
  setopt TYPESET_SILENT

  local __kb_collector=()
  local __kb_line_count=0

  dorothy-render-shell-keybinds --shell=zsh | while read -r line; do
    if ! [[ "$line" == $'\0' ]]; then
      __kb_collector+=("$line")
    else
      # process each grouping when a null delimiter is found.
      # printf '%s\n' "---------"

      # printf '%s\n' "> [${__kb_collector[1]}]"
      # printf '%s\n' "> [${__kb_collector[2]}]"
      # printf '%s\n' "> [${__kb_collector[3]}]"

      local key func_name func_body

      key="${__kb_collector[1]}"
      func_name="${__kb_collector[2]}"
      func_body="${__kb_collector[3]}"

      if [[ "$DEBUG" == 'yes' ]] ;then
        __debug_lines "key: $key" "func_name: $func_name" "func_body: $func_body"
      fi

      eval "$func_body"
      eval "zle -N $func_name" # register the name as zle command.

      for m in emacs vicmd viins; do
        eval "bindkey -M $m '^g^$key' $func_name"
        eval "bindkey -M $m '^g$key' $func_name"
      done

      # ------

      __kb_collector=() # reset for next iteration
    fi
  done
}

__zsh_load_binds

# # The first char is used for the binding for each (*)
# FZF_GIT_SELECTOR_ACTIONS=(
#   a_hashes
#   b_branches
#   e_each_ref
#   f_files
#   g_reflogs
#   s_master # this is not firing?!
#   r_remotes
#   t_tags
#   w_worktrees
#   y_stashes
# )
# __dorothy_zsh__generate_keybinds "${FZF_GIT_SELECTOR_ACTIONS[@]}"
