#!/bin/bash

# this script starts kmonad.
# It can be run automatically by adding
# a startup script under /Library/LaunchDaemons

# older macs (kext)
# /sbin/kextload /Library/Application\ Support/org.pqrs/Karabiner-VirtualHIDDevice/Extensions/org.pqrs.driver.Karabiner.VirtualHIDDevice.v061000.kext

/usr/local/bin/kmonad ~/code/kmonad/keymap/user/molleweide/mbp.kbd
