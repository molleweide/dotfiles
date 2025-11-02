#
# KEYBINDS DEFINITION
#

# TODO: ( ) Toggle keybinds on/off
# master switch should be here in this file, eg if it returns 1,
# but each shell config should also be able to toggle it off.

# NOTE: Maybe the leader should be exported instead?
#
# TODO:
# ( ) spec: inject output into prompt/at cursor
# ( ) use <seq>=<action>??
# Eg. g "pickers-git branches"
#
# ??? add a custom name later?? description?
# <seq> <name> "<command>"
#
# TEST: What happens if we start supplying more advanced args?
#
# TODO: How can we write this cat so that it nicely uses syntax highlghting
# Maybe, BASH -> BASH pattern will trigger TS injection highlghting.
# And then I can use comments do document each binding
#
#
# https://github.com/junegunn/fzf-git.sh

# <leader> <C-G>
cat <<-BASH
	  # This is a comment
		h   pickers-git   hashes
		b   pickers-git   branches
		#   rsarst
		e   pickers-git   each_ref
		f   pickers-git   files
		g   pickers-git   reflogs
		s   pickers-various    master
		r   pickers-git   remotes
		t   pickers-git   tags
		w   pickers-git   worktrees
		y   pickers-git   stashes
		# Handle double sequence
		# qw do-something ...
BASH

