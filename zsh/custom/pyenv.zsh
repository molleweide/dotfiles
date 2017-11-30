[[ "$(uname)" == "Darwin" ]] && export PYTHON_CONFIGURE_OPTS="--enable-framework"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
