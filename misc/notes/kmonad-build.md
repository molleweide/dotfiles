# KMONAD BUILD ERRORS

## MACOS INTEL

### META DATA
```
STACK   ->  2.7.3, Git revision 7927a3aec32e2b2e5e4fb5be76d0d50eddcc197f x86_64 hpack-0.34.4
GHC     ->  8.10.5
GHCUP   ->  v0.1.16.2
CABAL   ->  cabal-install version 3.6.0.0 \
            compiled using version 3.6.1.0 of the Cabal library
DEXT    ->  1.22.0

KMONAD BRANCH = master (commit???)
```

### stack.yaml

```
resolver: lts-18.9
compiler: ghc-8.10.5
packages:
- .
extra-deps:
pvp-bounds: both
```

### ERRORS
```shell
Building all executables for `kmonad' once. After a successful build of all of them, only specified executables will be rebuilt.
kmonad> configure (lib + exe)
Configuring kmonad-0.4.1...
kmonad> build (lib + exe)
Preprocessing library for kmonad-0.4.1..
Building library for kmonad-0.4.1..
[ 1 of 31] Compiling KMonad.Prelude
[ 2 of 31] Compiling KMonad.Keyboard.ComposeSeq
[ 3 of 31] Compiling KMonad.Args.TH
[ 4 of 31] Compiling KMonad.Util
[ 5 of 31] Compiling KMonad.Util.LayerStack
[ 6 of 31] Compiling KMonad.Util.MultiMap
[ 7 of 31] Compiling KMonad.Keyboard.Keycode
[ 8 of 31] Compiling KMonad.Keyboard.Types
[ 9 of 31] Compiling KMonad.Keyboard.IO
[10 of 31] Compiling KMonad.Keyboard.Ops
[11 of 31] Compiling KMonad.Keyboard
[12 of 31] Compiling KMonad.Model.Sluice
[13 of 31] Compiling KMonad.Model.Dispatch
[14 of 31] Compiling KMonad.Model.Action
[15 of 31] Compiling KMonad.Model.Hooks
[16 of 31] Compiling KMonad.Model.Button

/Users/hjalmarjakobsson/code/tools/kmonad/src/KMonad/Model/Button.hs:91:1: warning: [-Wunused-top-binds]
    Defined but not used: ‘onRelease’
   |
91 | onRelease p = mkButton (pure ()) p
   | ^^^^^^^^^
[17 of 31] Compiling KMonad.Model.BEnv
[18 of 31] Compiling KMonad.Model.Keymap
[19 of 31] Compiling KMonad.Model
[20 of 31] Compiling KMonad.Keyboard.IO.Mac.Types
[21 of 31] Compiling KMonad.Keyboard.IO.Mac.KextSink
[22 of 31] Compiling KMonad.Keyboard.IO.Mac.IOKitSource
[23 of 31] Compiling KMonad.Args.Types
[24 of 31] Compiling KMonad.Args.Joiner
[25 of 31] Compiling KMonad.App.Types
[26 of 31] Compiling KMonad.Args.Parser
[27 of 31] Compiling Paths_kmonad
[28 of 31] Compiling KMonad.Args.Cmd
[29 of 31] Compiling KMonad.Args
[30 of 31] Compiling KMonad.App.Main
[31 of 31] Compiling KMonad.App
Preprocessing executable 'kmonad' for kmonad-0.4.1..
Building executable 'kmonad' for kmonad-0.4.1..
[1 of 1] Compiling Main
Linking .stack-work/dist/x86_64-osx/Cabal-3.2.1.0/build/kmonad/kmonad ...
Undefined symbols for architecture x86_64:
  "_grab_kb", referenced from:
      _Lc3W4k_info in libHSkmonad-0.4.1-40BAqonTOElDH2SOCOLQkU.a(IOKitSource.o)
      _Lc3W4Q_info in libHSkmonad-0.4.1-40BAqonTOElDH2SOCOLQkU.a(IOKitSource.o)
  "_release_kb", referenced from:
      _Lc3W3E_info in libHSkmonad-0.4.1-40BAqonTOElDH2SOCOLQkU.a(IOKitSource.o)
  "_send_key", referenced from:
      _Lc3Vbq_info in libHSkmonad-0.4.1-40BAqonTOElDH2SOCOLQkU.a(KextSink.o)
  "_wait_key", referenced from:
      _Lc3VZA_info in libHSkmonad-0.4.1-40BAqonTOElDH2SOCOLQkU.a(IOKitSource.o)
ld: symbol(s) not found for architecture x86_64
collect2: error: ld returned 1 exit status
`gcc' failed in phase `Linker'. (Exit code: 1)

--  While building package kmonad-0.4.1 (scroll up to its section to see the error) using:
      /Users/hjalmarjakobsson/.stack/setup-exe-cache/x86_64-osx/Cabal-simple_mPHDZzAJ_3.2.1.0_ghc-8.10.7 --builddir=.stack-work/dist/x86_64-osx/Cabal-3.2.1.0 build lib:kmonad exe:kmonad --ghc-options " -fdiagnostics-color=always"
    Process exited with code: ExitFailure 1
./installers/keyboard: line 38: --flag: command not found
```

### when running build command again:

```
Building all executables for `kmonad' once. After a successful build of all of them, only specified executables will be rebuilt.
kmonad> build (lib + exe)
Preprocessing library for kmonad-0.4.1..
Building library for kmonad-0.4.1..
Preprocessing executable 'kmonad' for kmonad-0.4.1..
Building executable 'kmonad' for kmonad-0.4.1..
Linking .stack-work/dist/x86_64-osx/Cabal-3.2.1.0/build/kmonad/kmonad ...
Undefined symbols for architecture x86_64:
  "_grab_kb", referenced from:
      _Lc3TRt_info in libHSkmonad-0.4.1-AvDBr3ClNh02tEoK6r4xVv.a(IOKitSource.o)
      _Lc3TRZ_info in libHSkmonad-0.4.1-AvDBr3ClNh02tEoK6r4xVv.a(IOKitSource.o)
  "_release_kb", referenced from:
      _Lc3TQN_info in libHSkmonad-0.4.1-AvDBr3ClNh02tEoK6r4xVv.a(IOKitSource.o)
  "_send_key", referenced from:
      _Lc3SZg_info in libHSkmonad-0.4.1-AvDBr3ClNh02tEoK6r4xVv.a(KextSink.o)
  "_wait_key", referenced from:
      _Lc3TMJ_info in libHSkmonad-0.4.1-AvDBr3ClNh02tEoK6r4xVv.a(IOKitSource.o)
ld: symbol(s) not found for architecture x86_64
collect2: error: ld returned 1 exit status
`gcc' failed in phase `Linker'. (Exit code: 1)

--  While building package kmonad-0.4.1 (scroll up to its section to see the error) using:
      /Users/hjalmarjakobsson/.stack/setup-exe-cache/x86_64-osx/Cabal-simple_mPHDZzAJ_3.2.1.0_ghc-8.10.5 --builddir=.stack-work/dist/x86_64-osx/Cabal-3.2.1.0 build lib:kmonad exe:kmonad --ghc-options " -fdiagnostics-color=always"
    Process exited with code: ExitFailure 1
./installers/keyboard: line 38: --flag: command not found
```


================================================
================================================


## MACOS M1 SILICONE

### STACK VERSION

`Version 2.7.3, Git revision 7927a3aec32e2b2e5e4fb5be76d0d50eddcc197f x86_64 hpack-0.34.4`

### GHC VERSION

`The Glorious Glasgow Haskell Compilation System, version 8.10.5`



### ERROR

```
Warning: /Users/hjalmarjakobsson/code/tools/kmonad/stack.yaml: Unrecognized field in ProjectAndConfigMonoid: allow-never
WARNING: Ignoring Cabal's bounds on base (>=4.8 && <4.13); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring hashable's bounds on base (>=4.4 && <4.13); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring parallel's bounds on base (>=4.3 && <4.14); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring lens's bounds on template-haskell (>=2.4 && <2.15); using template-haskell-2.16.0.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring primitive's bounds on base (>=4.5 && <4.13); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring primitive's bounds on ghc-prim (>=0.2 && <0.6); using ghc-prim-0.6.1.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring optparse-applicative's bounds on base (>=4 && <4.13); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring unliftio-core's bounds on base (>=4.5 && <4.14); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring microlens's bounds on base (>=4.8 && <4.13); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
WARNING: Ignoring async's bounds on base (>=4.3 && <4.14); using base-4.14.3.0.
Reason: trusting snapshot over cabal file dependency information.
[1 of 2] Compiling Main             ( /Users/hjalmarjakobsson/.local/share/stack/setup-exe-src/setup-mPHDZzAJ.hs, /Users/hjalmarjakobsson/.local/share/stack/setup-exe-src/setup-mPHDZzAJ.o )

/var/folders/9x/2sl9wmt12l367t8pgctqpnwh0000gn/T/ghc7427_0/ghc_2.s:46:10: error:
     error: unexpected token in argument list
            leaq -16(%rbp),%rax
                    ^
   |
46 |         leaq -16(%rbp),%rax
   |          ^
...
...
...
...
...
...
...
...
...

340 |         jmp *-16(%r13)
    |      ^

/var/folders/9x/2sl9wmt12l367t8pgctqpnwh0000gn/T/ghc7427_0/ghc_2.s:340:6: error:
     error: invalid operand
            jmp *-16(%r13)
                ^
    |
340 |         jmp *-16(%r13)
    |      ^
`gcc' failed in phase `Assembler'. (Exit code: 1)

--  While building simple Setup.hs (scroll up to its section to see the error) using:
      /Users/hjalmarjakobsson/.local/share/stack/programs/x86_64-osx/ghc-8.10.6/bin/ghc-8.10.6 -rtsopts -threaded -clear-package-db -global-package-db -hide-all-packages -package base -main-is StackSetupShim.mainOverride -package Cabal-3.2.1.0 /Users/hjalmarjakobsson/.local/share/stack/setup-exe-src/setup-mPHDZzAJ.hs /Users/hjalmarjakobsson/.local/share/stack/setup-exe-src/setup-shim-mPHDZzAJ.hs -o /Users/hjalmarjakobsson/.local/share/stack/setup-exe-cache/x86_64-osx/tmp-Cabal-simple_mPHDZzAJ_3.2.1.0_ghc-8.10.6
    Process exited with code: ExitFailure 1
./installers/keyboard: line 37: --arch=aarch64: command not found
./installers/keyboard: line 40: --flag: command not found
```
