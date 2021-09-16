# KMONAD BUILD ERRORS

why is a special version of ghc being installed??
    to isolated location??


## MACOS INTEL

### STACK VERSION

`Version 2.7.3, Git revision 7927a3aec32e2b2e5e4fb5be76d0d50eddcc197f x86_64 hpack-0.34.4`

### GHC VERSION

`The Glorious Glasgow Haskell Compilation System, version 8.10.5`

### GHCUP VERSION

`The GHCup Haskell installer, version v0.1.16.2`

### CABAL VERSION

```
cabal-install version 3.6.0.0
compiled using version 3.6.1.0 of the Cabal library
```

### DEXT VERSION

`1.22.0`

### BRANCH

`master`


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
