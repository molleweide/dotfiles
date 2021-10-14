# DOROTHY NOTES

next -> create setup paths command

1. Do you have any thoughts on `zshenv` and `zprofile`?
    So, I am understanding that in order to use dorothy, I have to move
    my sources (aliases, options, etc..) from `~/.config/zsh` into `user/sources`.
    And stop using `zshenv` and `zprofile` at the moment, and maybe figure out
    how to use them later.

2. Will symlinking my config files into `~/.config` create any conflicts with dorothy?
    I dunno if this is a good question, but does anything pop up in your head?

3. Do you recommend I copy defaults.bash into my user, or should I edit that file directly?
    Currently I have copied your `generic.bash` into `user/sources` and play around with it.
    
4. Again, a question about XDG.
    If I put my script `xdg.zsh` and source it under `dorothy/user/sources/xdg`,
    then at this time currently it will break dorothy right? Because dorothy
    has a lot of hardcoded checks for paths under home, etc.? I am trying to figure out if it would
    be possible to use my old XDG path file somehow but I don't think so currently.
    Do you have any further suggestions that come to your mind?

5. How would I use Antigen plugin manager for zsh?
