# DOROTHY NOTES

1. about xdg again.

    Nice to see you find this interesting. It has made
    my home dir super clean. I have btw 10-15 files/dirs there now. All
    configs are put under `.config`, and all programs data stuff
    is put under `.local/shared`. Here are two dot repos that adhere 
    to xdg that have inspired me:

    git@github.com:LukeSmithxyz/voidrice.git
        take a look at `zprofile`
    git@github.com:mattmc3/dotfiles.git
        `zsh/zshrc.d/00-xdg.zsh`

2. I haven't run any of the dorothy scripts myself.
    What I am trying to do is to conform my own dotfiles
    to the dorothy structure and I got stuck on the $DOROTHY
    variable

3. Zsh support for dorothy is probably excellent and
    the issue here is that I am an idiot.

4. I believe that I got confused because I didn't understand
    how the init files where loaded but now reading your
    answer and seeing how the printf statements work
    at the bottome of the `setup-dorothy` file I believe
    that I am starting to understand.
