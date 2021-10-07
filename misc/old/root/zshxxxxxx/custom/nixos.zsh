NIX_SCRIPT="$HOME/.nix-profile/etc/profile.d/nix.sh"

[ -f "$NIX_SCRIPT" ] && source "$NIX_SCRIPT"

HOME_MANAGER_SCRIPT="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

[ -f "$HOME_MANAGER_SCRIPT" ] && source "$HOME_MANAGER_SCRIPT"
