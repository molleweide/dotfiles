
#
# KEYBINDS DEFINITION
#

# NOTE: Maybe the leader should be exported instead?
#
# TODO:
# ( ) spec: inject output into prompt/at cursor
# ( ) use <seq>=<action>??
# Eg. g "fzf-helper git_branches"
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
  # NOTE: Here it should be [a pickers-git hashes]
	a fzf-helper git_hashes
	b fzf-helper git_branches
	# rsarst
	e fzf-helper git_each_ref
	f fzf-helper git_files
	g fzf-helper git_reflogs
	s fzf-helper master
	r fzf-helper git_remotes
	t fzf-helper git_tags
	w fzf-helper git_worktrees
	y fzf-helper git_stashes
	# Handle double sequence
	# qw do-something ...
BASH
