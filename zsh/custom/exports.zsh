# Editor
export EDITOR=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Path
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

if command -v yarn >/dev/null 2>&1; then
  export PATH="$PATH:`yarn global bin`"
fi

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="./node_modules/.bin:$PATH"
export PATH="~/.fzf/bin:$PATH"

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

export RESTIC_REPOSITORY="b2:dbalatero-backup"
export SYNC_REPO="$RESTIC_REPOSITORY:/Sync"
export FREEZE_REPO="$RESTIC_REPOSITORY:/Freeze"
