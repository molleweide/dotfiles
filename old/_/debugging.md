# possible fixes

# :version

```
:version
NVIM v0.4.3
Build type: Release
LuaJIT 2.0.5
Compilation: /usr/local/Homebrew/Library/Homebrew/shims/mac/super/clang -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -DNDEBUG -DMIN_LOG_LEVEL=3 -Wall -Wextra -pedantic -Wno-unuse
d-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wmissing-prototypes -Wimplicit-fallthrough -Wvla -fstack-protector-strong -fdiagnostics-color=auto -DINCL
UDE_GENERATED_DECLARATIONS -D_GNU_SOURCE -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -I/tmp/neovim-20191107-13403-1or2rj3/neovim-0.4.3/build/config -I/tmp/neovim-
20191107-13403-1or2rj3/neovim-0.4.3/src -I/usr/local/include -I/tmp/neovim-20191107-13403-1or2rj3/neovim-0.4.3/deps-build/include -I/usr/local/opt/gettext/include -I/Appli
cations/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/usr/include -I/tmp/neovim-20191107-13403-1or2rj3/neovim-0.4.3/build/src/nvim/
auto -I/tmp/neovim-20191107-13403-1or2rj3/neovim-0.4.3/build/include
Compiled by brew@Mojave.local

Features: +acl +iconv +tui
See ":help feature-compile"

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/usr/local/Cellar/neovim/0.4.3/share/nvim"
```

# :checkhealth

```
## Ruby provider (optional)
  - INFO: Ruby: ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]
  - WARNING: `neovim-ruby-host` not found.
    - ADVICE:
      - Run `gem install neovim` to ensure the neovim RubyGem is installed.
      - Run `gem environment` to ensure the gem bin directory is in $PATH.
      - If you are using rvm/rbenv/chruby, try "rehashing".
      - See :help |g:ruby_host_prog| for non-standard gem installations.
```

# :messages

```
internal/modules/cjs/loader.js:605
    throw err;
    ^
Error: Cannot find module 'neovim'
    at Function.Module._resolveFilename (internal/modules/cjs/loader.js:603:15)
    at Function.Module._load (internal/modules/cjs/loader.js:529:25)
    at Module.require (internal/modules/cjs/loader.js:657:17)
    at require (internal/modules/cjs/helpers.js:22:18)
    at Object.<anonymous> (/Users/hjalmarjakobsson/Sites/dotfiles/symlink/config/nvim/plugged/markdown-preview.nvim/app/lib/app/preloadmodules.js:3:16)
    at Module._compile (internal/modules/cjs/loader.js:721:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:732:10)
    at Module.load (internal/modules/cjs/loader.js:620:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:560:12)
    at Function.Module._load (internal/modules/cjs/loader.js:552:3)
```
