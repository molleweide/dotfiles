# KMONAD

1. check system/kernel logs
2. read kextutil(8)

run sudo sbin

- path to karab kext
    `stack build --extra-include-dirs=
    /Library/Application Support/org.pqrs/Karabiner-VirtualHIDDevice/Extensions/org.pqrs.driver.Karabiner.VirtualHIDDevice.v061000.kext`


input monitoring
    https://github.com/david-janssen/kmonad/issues/105

## syntax highlighting n stuff

https://github.com/david-janssen/kmonad/issues/69

## /sbin/kextload

```sh
/Library/Application failed to load - (libkern/kext) not found; check the system/kernel logs for errors or try kextutil(8).

>>> where???

/Users/hjalmarjakobsson/.dotfiles/Support/org.pqrs/Karabiner-VirtualHIDDevice/Extensions/org.pqrs.driver.Karabiner.VirtualHIDDevice.v061000.kext failed to load - (libkern/kext) not found; check the system/kernel logs for errors or try kextutil(8).
```

IS THE ERROR MESSAGE DIFFERENT IF I RUN KMONAD WHEN KARABINER
IS TURNED ON??

## KEXT DOCS
https://support.apple.com/guide/deployment-reference-macos/kernel-extensions-in-macos-apd37565d329/web
