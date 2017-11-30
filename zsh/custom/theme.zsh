setopt prompt_subst

rvm_prompt() {
  if [ -f ~/.rvm/bin/rvm-prompt ]; then
    version=$(~/.rvm/bin/rvm-prompt v)

    if [ ! -z $version ]; then
      echo "[$version]"
    fi
  fi
}

git_prompt() {
  ref=$(git symbolic-ref HEAD 2>/dev/null)

  if [ ! -z $ref ]; then
    newref=$(echo $ref | cut -d'/' -f3,4)
    echo $newref
  fi
}

node_prompt() {
  if ! command -v nvm; then
    echo ""
    return 1
  fi

  local nvmrc=$(nvm_find_nvmrc)

  if [ ! -z $nvmrc ]; then
    version=$((cat $nvmrc 2>/dev/null) || echo "")

    if [ ! -z $version ]; then
      echo "[$version]"
    fi
  fi 
}

# Get the name of the branch we are on
git_prompt_info() {
  branch_prompt=$(git_prompt)

  if [ -n "$branch_prompt" ]; then
    status_icon=$(git_status)
    # xargs strips whitespace

    if [ -z $status_icon ]; then
      echo "($branch_prompt)"
    else
      echo "($branch_prompt) $status_icon"
    fi
  fi
}

# Show character if changes are pending
git_status() {
  if current_git_status=$(git status | grep 'added to commit' 2> /dev/null); then
    echo "☠ "
  fi
}

export PROMPT='%{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg[yellow]%}$(git_prompt_info)%{$reset_color%} %{$fg[red]%}$(rvm_prompt)%{$reset_color%} %{$fg[blue]%}$(node_prompt)%{$reset_color%} %% '
