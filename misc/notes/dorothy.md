# DOROTHY NOTES

next -> create setup paths command

- Do you have any thoughts on `zshenv` and `zprofile`?
    So, I am understanding that in order to use dorothy, I have to move
    my sources (aliases, options, etc..) from `~/.config/zsh` into `user/sources`.
    And stop using `zshenv` and `zprofile` at the moment, and maybe figure out
    how to use them later.

- Do you recommend I copy defaults.bash into my user, or should I edit that file directly?
    Currently I have copied your `generic.bash` into `user/sources` and play around with it.
    
- Again, a question about XDG.
    My solution now to managing paths is to copy all of my exports from my `.zprofile` and
    put them under `$DOROTHY/user/commands/setup-user-paths` (i rename to avoid naming conflicts),
    and then in `user/source.sh` I `eval ...setup-user-paths`.
