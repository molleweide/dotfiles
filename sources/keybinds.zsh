# =======================================================
# [ZSH] BINDINGS
#
# See `man zshzle` for more info.
# =======================================================

#
# TODO: remove these and use bash.bash instead.
DEBUG_FZF="yes"

__print_lines(){
        printf "%s\n" "$1"
      }

__debug_lines(){
      if (( "$DEBUG_FZF" == "yes" )); then
        __print_lines "[sources/load_binds]: $1"
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

  # local available_funcs=$(declare -f)
  # __print_lines "${available_funcs[@]}"

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

__kb_collector=()

# line: y
# line: fzf-git-stashes-widget
# line: fzf-git-stashes-widget() { local result=$(fzf-helper stashes | __join_keybind_output_for_prompt_injection); echo "${result[@]}"; zle reset-prompt; LBUFFER+=$result }
dorothy-render-shell-keybinds --shell=zsh | while read -r line; do
  # echo -n "$line" | od -A n -t x1

  # # testing
  # [[ "$__kb_line_count" -eq 0 ]] && echo "keybinds.zsh first line"
  # __kb_line_count=$((__kb_line_count + 1))

  __kb_collector+=("$line")

  # if [[ "$line" == *$'\0\n'* ]]; then
  if [[ "$line" == $'\0' ]]; then
    printf '%s\n' "${__kb_collector[@]}" "---------"

    # eval "$eval_str__zsh_create_func_handle"

    # eval "zle -N $zsh_bind_func_handle" # what is the zle command?

    # for m in emacs vicmd viins; do
    #   eval "bindkey -M $m '^g^$key' $zsh_bind_func_handle"
    #   eval "bindkey -M $m '^g$key' $zsh_bind_func_handle"
    # done


    __kb_collector=() # reset for next iteration
  fi


done # < <(dorothy-render-shell-keybinds --shell=zsh)

# TODO:
# 1. capture output of dorothy render
# 2. pass to func
# 3. parse array data and create binds

# The first char is used for the binding for each (*)
FZF_GIT_SELECTOR_ACTIONS=(
  a_hashes
  b_branches
  e_each_ref
  f_files
  g_reflogs
  s_master # this is not firing?!
  r_remotes
  t_tags
  w_worktrees
  y_stashes
)

__dorothy_zsh__generate_keybinds "${FZF_GIT_SELECTOR_ACTIONS[@]}"
