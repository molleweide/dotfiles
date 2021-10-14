# DOROTHY NOTES

- Do you have any thoughts on `zshenv` and `zprofile`?
    So, I am understanding that in order to use dorothy, I have to move
    my sources (aliases, options, etc..) from `~/.config/zsh` into `user/sources`.
    And stop using `zshenv` and `zprofile` at the moment, and maybe figure out
    how to use them later. BUT at the moment using dorothy means that the whole
    `config/zsh` dir should pretty much be moved into `.dorothy`

- My solution for managing paths is to copy all of my exports from my `.zprofile` and
    put them under `$DOROTHY/user/commands/setup-user-paths` (i rename to avoid naming conflicts??),
    and then in `user/source.sh` I do `eval ...setup-user-paths`.

- Then, I also have my own personal `setup-user` command that runs all of my personal installers.
    
