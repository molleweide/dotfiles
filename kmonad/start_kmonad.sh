#!/bin/bash

# osascript -e 'quit app "Karabiner"'
/sbin/kextload /Library/Application\ Support/org.pqrs/Karabiner-VirtualHIDDevice/Extensions/org.pqrs.driver.Karabiner.VirtualHIDDevice.v061000.kext
/usr/local/bin/kmonad ~/.dotfiles/kmonad/mbp.kbd
