bot "VIM Setup"
read -r -p "VIM: Install and update plugins now? [y|N] " response
if [[ $response =~ (y|yes|Y) ]];then
  bot "Installing vim plugins"
  # cmake is required to compile vim bundle YouCompleteMe
  # require_brew cmake
  nvim +PluginInstall +qall > /dev/null 2>&1
  nvim +UpdateRemotePlugins +qall
  ok
else
  ok "skipped. Install by running :PluginInstall within nvim"
fi

# tmux plugin manager install
 bot "TMUX / TMUX PLUGIN MANAGER Setup"
 
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  bot "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
  ok
else
  ok "Tmux plugin manager already installed."
fi
