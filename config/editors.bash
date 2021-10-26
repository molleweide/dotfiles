#!/usr/bin/env bash

# our editors in order of preference
export TERMINAL_EDITORS=(
	nvim
	vim # --noplugin -c "set nowrap"'
	micro
	nano
)
export GUI_EDITORS=(
	"code -w"
	"atom -w"
	"subl -w"
	gedit
)
