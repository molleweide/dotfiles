setopt prompt_subst

autoload -U promptinit
promptinit

# SPACESHIP_PROMPT_ORDER=(
#   dir           # Current directory section
#   git           # Git section (git_branch + git_status)
#   node          # Node.js section
#   ruby          # Ruby section
#   elixir        # Elixir section
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )

# SPACESHIP_NODE_SHOW=true

# prompt spaceship

POWERLEVEL9K_VI_INSERT_MODE_STRING="[I]"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="[N]"
POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode os_icon dir nvm rvm vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator time command_execution_time)

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_RVM_BACKGROUND="009"
POWERLEVEL9K_RVM_FOREGROUND="255"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="255"

POWERLEVEL9K_OS_ICON_BACKGROUND="231"
POWERLEVEL9K_OS_ICON_FOREGROUND="black"

POWERLEVEL9K_NVM_BACKGROUND="231"

# To get colors:
#
#   $ for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="056"
POWERLEVEL9K_DIR_HOME_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
POWERLEVEL9K_DIR_ETC_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="021"
POWERLEVEL9K_DIR_HOME_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
POWERLEVEL9K_DIR_ETC_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "

source ~/.zsh/vendor/powerlevel10k/powerlevel10k.zsh-theme
