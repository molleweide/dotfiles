is-mac && export PYTHON_CONFIGURE_OPTS="--enable-framework"
is-linux && export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# echo_and_eval_var_set PATH "$PYENV_ROOT/bin:$PATH"
