#!/bin/bash

# this script starts kmonad.
# It can be run automatically by adding
# a startup script under /Library/LaunchDaemons

# older macs (kext)
# /sbin/kextload /Library/Application\ Support/org.pqrs/Karabiner-VirtualHIDDevice/Extensions/org.pqrs.driver.Karabiner.VirtualHIDDevice.v061000.kext

~/.local/bin/kmonad ~/code/tools/kmonad/keymap/user/molleweide/ergodox_ez.kbd
