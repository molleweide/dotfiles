(old mac) pip list returns -------------------------------------------
hjalmarjakobsson@hjalmarRetina14 ? ~ ? pip3 list --local                                                                                                                                                                                           ? ? ? ? ? 3645 ? 18:17:58
Package            Version
------------------ -------
ansicolor          0.2.6
appdirs            1.4.3
argcomplete        1.11.0
chardet            3.0.4
colorama           0.4.3
coverage           5.0.1
entrypoints        0.3
flake8             3.7.9
flake8-polyfill    1.0.2
greenlet           0.4.15
hjson              3.0.1
importlib-metadata 1.3.0
mccabe             0.6.1
more-itertools     8.0.2
msgpack            0.6.2
neovim             0.3.1
nose2              0.9.1
pandoc-eqnos       2.1.1
pandoc-fignos      2.2.0
pandoc-xnos        2.3.0
pandocfilters      1.4.2
pep8-naming        0.9.1
pip                20.0.2
psutil             5.6.7
pycodestyle        2.5.0
pyflakes           2.1.1
pynvim             0.3.2
PyYAML             5.1.2
setuptools         46.0.0
six                1.13.0
vim-vint           0.3.21
wheel              0.34.2
zipp               0.6.0


(old mac) gem list returns ------------------------------------
benchmark (default: 0.1.0)
bigdecimal (default: 2.0.0)
bundler (default: 2.1.2)
cgi (default: 0.1.0)
csv (default: 3.1.2)
date (default: 3.0.0)
dbm (default: 1.1.0)
delegate (default: 0.1.0)
did_you_mean (default: 1.4.0)
etc (default: 1.1.0)
fcntl (default: 1.0.0)
fiddle (default: 1.0.0)
fileutils (default: 1.4.1)
forwardable (default: 1.3.1)
getoptlong (default: 0.1.0)
io-console (default: 0.5.6)
ipaddr (default: 1.2.2)
irb (default: 1.2.3)
json (default: 2.3.0)
logger (default: 1.4.2)
matrix (default: 0.2.0)
minitest (5.13.0)
mutex_m (default: 0.1.0)
net-pop (default: 0.1.0)
net-smtp (default: 0.1.0)
net-telnet (0.2.0)
observer (default: 0.1.0)
open3 (default: 0.1.0)
openssl (default: 2.1.2)
ostruct (default: 0.2.0)
power_assert (1.1.7)
prime (default: 0.1.1)
pstore (default: 0.1.0)
psych (default: 3.1.0)
racc (default: 1.4.16)
rake (13.0.1)
rdoc (default: 6.2.1)
readline (default: 0.0.2)
readline-ext (default: 0.1.0)
reline (default: 0.1.3)
rexml (default: 3.2.3)
rss (default: 0.2.8)
sdbm (default: 1.0.0)
singleton (default: 0.1.0)
stringio (default: 0.1.0)
strscan (default: 1.0.3)
test-unit (3.3.4)
timeout (default: 0.1.0)
tracer (default: 0.1.0)
uri (default: 0.10.0)
webrick (default: 1.6.0)
xmlrpc (0.3.0)
yaml (default: 0.1.0)
zlib (default: 1.1.0)


(old mac) mas list -------------------------------------------
408981381 iPhoto (9.6.1)
405580712 StuffIt Expander (15.0.7)
914182966 QuickNome (1.1)


#########################################################################################



/*
module.exports = {
  brew: [
    // http://conqueringthecommandline.com/book/ack_ag
    //"ack",
    //"ag",
    // https://github.com/wting/autojump
    //"autojump",
    // alternative to `cat`: https://github.com/sharkdp/bat
    //"bat",
    // Install GNU core utilities (those that come with macOS are outdated)
    // DonÕt forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    //"coreutils",
    //"dos2unix",
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    //"findutils",
    // 'fortune',
    "fzf",
    "ripgrep",
    //"readline", // ensure gawk gets good readline
    //"gawk",
    // http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
    //"gifsicle",
    //"gnupg",
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    //"gnu-sed --with-default-names",
    // upgrade grep so we can get things like inverted match (-v)
    //"grep --with-default-names",
    // better, more recent grep
    //"homebrew/dupes/grep",
    // https://github.com/jkbrzt/httpie
    //"httpie",
    // jq is a sort of JSON grep
    //"jq",
    // Mac App Store CLI: https://github.com/mas-cli/mas
    "mas",
    // Install some other useful utilities like `sponge`
    //"moreutils",
    //"nmap",
    //"openconnect",
    //"reattach-to-user-namespace",
    // better/more recent version of screen
    //"homebrew/dupes/screen",
    "tmux",
    //"todo-txt",
    //"tree",
    //"ttyrec",
    // better, more recent vim
    //"vim --with-client-server --with-override-system-vi",
    "neovim",
    //"watch",
    // Install wget with IRI support
    //"wget --enable-iri",
    "z",
  ],
  cask: [
    //'adium',
    //'amazon-cloud-drive',
    "atom",
    // 'box-sync',
    "brave-browser",
    //'comicbooklover',
    "criptext",
    //'diffmerge',
    //"docker", // docker for mac
    //'dropbox',
    //'evernote',
    "flux",
    //"gpg-suite",
    //'ireadfast',
    "iterm2",
    //"little-snitch",
    //"macbreakz",
    //"micro-snitch",
    "signal",
    //'macvim',
    //"sizeup",
    //'sketchup',
    "slack",
    "spotify",
    //"the-unarchiver",
    //'torbrowser',
    //'transmission',
    //"visual-studio-code",
    //'vlc',
    //"xquartz",
  ],
  pip: ["pynvim", "vim-vint"], // py "neovim" is outdated
  gem: ["neovim"],
  npm: [
    // "antic",
    "bash-language-server",
    // "buzzphrase",
    // "eslint",
    // "instant-markdown-d",
    // 'generator-dockerize',
    // 'gulp',
    "neovim",
    //"npm-check-updates",
    //"prettyjson",
    "spaceship-prompt",
    //"trash",
    "vtop",
    // ,'yo'
  ],
  mas: [
    //com.apple.dt.Xcode (10.2.1)
    //"497799835",
    //com.if.Amphetamine (4.1.6)
    //'937984704',
    //net.shinyfrog.bear (1.6.15)
    //'1091189122',
    //com.monosnap.monosnap (3.5.8)
    //'540348655',
    //com.app77.pwsafemac (4.17)
    //'520993579',
    // Magnet (2.4.5)
    "441258766",
  ],
};
*/


