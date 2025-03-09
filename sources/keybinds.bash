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
# [BASH] BINDINGS
# =======================================================
# man BASH
#
# bind [-m keymap] [-lpsvPSVX]
# bind [-m keymap] [-q function] [-u function] [-r keyseq]
# bind [-m keymap] -f filename
# bind [-m keymap] -x keyseq:shell-command
# bind [-m keymap] keyseq:function-name
# bind [-m keymap] keyseq:readline-command
# bind readline-command-line
#        Display current readline key and function bindings, bind a key sequence to a readline
#        function or macro, or set a readline variable.  Each non-option argument is a command as
#        it would appear in a readline initialization file such as .inputrc, but each binding or
#        command must be passed as a separate argument; e.g., '"\C-x\C-r": re-read-init-file'.
#        Options, if supplied, have the following meanings:
#        -m keymap
#               Use keymap as the keymap to be affected by the subsequent bindings.  Acceptable
#               keymap names are emacs, emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move,
#               vi-command, and vi-insert.  vi is equivalent to vi-command (vi-move is also a
#               synonym); emacs is equivalent to emacs-standard.
#        -l     List the names of all readline functions.
#        -p     Display readline function names and bindings in such a way that they can be re-
#               read.
#        -P     List current readline function names and bindings.
#        -s     Display readline key sequences bound to macros and the strings they output in such
#               a way that they can be re-read.
#        -S     Display readline key sequences bound to macros and the strings they output.
#        -v     Display readline variable names and values in such a way that they can be re-read.
#        -V     List current readline variable names and values.
#        -f filename
#               Read key bindings from filename.
#        -q function
#               Query about which keys invoke the named function.
#        -u function
#               Unbind all keys bound to the named function.
#        -r keyseq
#               Remove any current binding for keyseq.
#        -x keyseq:shell-command
#               Cause shell-command to be executed whenever keyseq is entered.  When shell-command
#               is executed, the shell sets the READLINE_LINE variable to the contents of the
#               readline line buffer and the READLINE_POINT and READLINE_MARK variables to the
#               current location of the insertion point and the saved insertion point (the mark),
#               respectively.  The shell assigns any numeric argument the user supplied to the
#               READLINE_ARGUMENT variable.  If there was no argument, that variable is not set.
#               If the executed command changes the value of any of READLINE_LINE, READLINE_POINT,
#               or READLINE_MARK, those new values will be reflected in the editing state.
#        -X     List all key sequences bound to shell commands and the associated commands in a
#               format that can be reused as input.
#
#        The return value is 0 unless an unrecognized option is given or an error occurred.

if [[ -n "${BASH_VERSION:-}" ]]; then

  __fzf_git_init() {
    __debug_lines "bash not supported yet"
    # bind -m emacs-standard '"\er":  redraw-current-line'
    # bind -m emacs-standard '"\C-z": vi-editing-mode'
    # bind -m vi-command     '"\C-z": emacs-editing-mode'
    # bind -m vi-insert      '"\C-z": emacs-editing-mode'
    #
    # local o c
    # for o in "$@"; do
    #   c=${o:0:1}
    #   bind -m emacs-standard '"\C-g\C-'$c'": " \C-u \C-a\C-k`_fzf_git_'$o'`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
    #   bind -m vi-command     '"\C-g\C-'$c'": "\C-z\C-g\C-'$c'\C-z"'
    #   bind -m vi-insert      '"\C-g\C-'$c'": "\C-z\C-g\C-'$c'\C-z"'
    #   bind -m emacs-standard '"\C-g'$c'":    " \C-u \C-a\C-k`_fzf_git_'$o'`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
    #   bind -m vi-command     '"\C-g'$c'":    "\C-z\C-g'$c'\C-z"'
    #   bind -m vi-insert      '"\C-g'$c'":    "\C-z\C-g'$c'\C-z"'
    # done
  }
fi

# =======================================================
# MAKE BINDINGS
#

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

__fzf_git_init "${FZF_GIT_SELECTOR_ACTIONS[@]}"
