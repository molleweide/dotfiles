DEBUG_FZF="yes"

__print_lines(){
        printf "%s\n" "$1"
      }

__debug_lines(){
      if (( "$DEBUG_FZF" == "yes" )); then
        __print_lines "[sources/load_binds]: $1"
      fi
}

# bindkey: list all keybinds

# =======================================================
# [ZSH] BINDINGS
# =======================================================
#
# >> `:Man zshzle`
#
# reset-prompt (unbound) (unbound) (unbound)
#        Force the prompts on both the left and right of the screen to be
#        re-expanded, then redisplay the edit buffer.  This reflects
#        changes both to the prompt variables themselves and changes in
#        the expansion of the values (for example, changes in time or
#        directory, or changes to the value of variables referred to by
#        the prompt).
#
#        Otherwise, the prompt is only expanded each time zle starts, and
#        when the display has been interrupted by output from another
#        part of the shell (such as a job notification) which causes the
#        command line to be reprinted.
#
#        reset-prompt doesn't alter the special parameter LASTWIDGET.
#
#
# USER-DEFINED WIDGETS
#        User-defined widgets, being implemented as shell functions, can
#        execute any normal shell command.  They can also run other
#        widgets (whether built-in or user-defined) using the zle builtin
#        command. The standard input of the function is redirected from
#        /dev/null to prevent external commands from unintentionally
#        blocking ZLE by reading from the terminal, but read -k or read
#        -q can be used to read characters.  Finally, they can examine
#        and edit the ZLE buffer being edited by reading and setting the
#        special parameters described below.
#
#        These special parameters are always available in widget
#        functions, but are not in any way special outside ZLE.  If they
#        have some normal value outside ZLE, that value is temporarily
#        inaccessible, but will return when the widget function exits.
#        These special parameters in fact have local scope, like
#        parameters created in a function using local.
#
#        Inside completion widgets and traps called while ZLE is active,
#        these parameters are available read-only.
#
#        Note that the parameters appear as local to any ZLE widget in
#        which they appear.  Hence if it is desired to override them this
#        needs to be done within a nested function:
#
#               widget-function() {
#                 # $WIDGET here refers to the special variable
#                 # that is local inside widget-function
#                 () {
#                    # This anonymous nested function allows WIDGET
#                    # to be used as a local variable.  The -h
#                    # removes the special status of the variable.
#                    local -h WIDGET
#                 }
#               }
#
#
#      LBUFFER (scalar)
#              The part of the buffer that lies to the left of the cursor position.  If it is assigned to, only that part of the
#              buffer is replaced, and the cursor remains between the new $LBUFFER and the old $RBUFFER.


if [[ -n "${ZSH_VERSION:-}" ]]; then


  # NOTE: function responsible for joining data together for injecting output
  # inte prompt with ZLE.
  # TODO: ( ) move this to its own command.
  # !!! Should be able to use `echo-join` here.
  # >>>> Remember to replace this in all `dorothy-render-shell-keybinds`
  __join_keybind_output_for_prompt_injection() {
    local line
    while read line; do
      echo -n "${(q)line} "
    done
  }

  # there is some type of error that I have to figure out.
  set -e

  __dorothy_zsh__generate_keybinds() {

    # local available_funcs=$(declare -f)
    # __print_lines "${available_funcs[@]}"

    local m o
    for o in "$@"; do

      # why do we have to generate custom functions???

      local key="${o:0:1}"
      local picker_name="${o:2}"

      local zsh_bind_func_handle="fzf-git-$picker_name-widget"

      local fzf_action="fzf-helper $picker_name"

      local eval_str__zsh_create_func_handle="$zsh_bind_func_handle() { local result=\$($fzf_action | __join_keybind_output_for_prompt_injection); echo \"\${result[@]}\"; zle reset-prompt; LBUFFER+=\$result }"

      # make the func handlers available in the shell.
      eval "$eval_str__zsh_create_func_handle"

      # >> Mark the func handlers as zsh-widgets
      # This seems to be required in order to enable the use of LBUFFER, inside of
      # the widget
      #
      #        zle -N widget [ function ]
      #               Create a user-defined widget.  If there is already a widget with
      #               the specified name, it is overwritten.  When the new widget is
      #               invoked from within the editor, the specified shell function is
      #               called.  If no function name is specified, it defaults to the
      #               same name as the widget.  For further information, see the
      #               section `Widgets' below.
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
  set +e
fi

# =======================================================
# MAKE BINDINGS
#

# TODO: export this array / define it in another source file, so that all
# shell files can use it.
# If this array is exported through `environment.bash`, then all shells can
# access it.
# ( ) put in export location.
# ( ) analyse if:
#     - the function comes from a command -> then trim out the command and call command.
#     - is a source/shell function??

dorothy-render-shell-keybinds --shell=zsh

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
