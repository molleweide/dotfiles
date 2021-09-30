# KMONAD BUILD ERRORS

## command

```bash
stack build --flag kmonad:dext \
    --local-bin-path=/usr/local/bin \
    --extra-include-dirs=c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit:c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/src/Client/vendor/include
```

## stack.yaml

```yaml
resolver: lts-18.12
packages:
- .
extra-deps:
pvp-bounds: both
```

## error

```shell
[31 of 31] Compiling KMonad.App
In file included from /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/hid/IOHIDLib.h:31,
                 from c_src/mac/keyio_mac.hpp:1,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:1:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/hid/IOHIDDevice.h:298:34: error:
     error: 'dispatch_block_t' has not been declared
      298 |                                  dispatch_block_t               handler)
          |                                  ^~~~~~~~~~~~~~~~
    |
298 |                                  dispatch_block_t               handler)
    |                                  ^
In file included from /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/hid/IOHIDLib.h:35,
                 from c_src/mac/keyio_mac.hpp:1,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:1:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/hid/IOHIDManager.h:295:33: error:
     error: 'dispatch_block_t' has not been declared
      295 |                                 dispatch_block_t                handler)
          |                                 ^~~~~~~~~~~~~~~~
    |
295 |                                 dispatch_block_t                handler)
    |                                 ^
In file included from /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/hid/IOHIDLib.h:36,
                 from c_src/mac/keyio_mac.hpp:1,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:1:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/hid/IOHIDQueue.h:297:33: error:
     error: 'dispatch_block_t' has not been declared
      297 |                                 dispatch_block_t                handler)
          |                                 ^~~~~~~~~~~~~~~~
    |
297 |                                 dispatch_block_t                handler)
    |                                 ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:7,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_keyboard_input.hpp:23:44: error:
     warning: 'unused' attribute ignored [-Wattributes]
       23 |   uint8_t report_id_ __attribute__((unused));
          |                                            ^
   |
23 |   uint8_t report_id_ __attribute__((unused));
   |                                            ^

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_keyboard_input.hpp:26:8: error:
     error: declaration of 'pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::apple_vendor_keyboard_input::keys' changes meaning of 'keys' [-fpermissive]
       26 |   keys keys;
          |        ^~~~
   |
26 |   keys keys;
   |        ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_keyboard_input.hpp:7,
                 from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:7,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keys.hpp:15:31: error:
     note: 'keys' declared here as 'class pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys'
       15 | class __attribute__((packed)) keys final {
          |                               ^~~~
   |
15 | class __attribute__((packed)) keys final {
   |                               ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:8,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_top_case_input.hpp:23:44: error:
     warning: 'unused' attribute ignored [-Wattributes]
       23 |   uint8_t report_id_ __attribute__((unused));
          |                                            ^
   |
23 |   uint8_t report_id_ __attribute__((unused));
   |                                            ^

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_top_case_input.hpp:26:8: error:
     error: declaration of 'pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::apple_vendor_top_case_input::keys' changes meaning of 'keys' [-fpermissive]
       26 |   keys keys;
          |        ^~~~
   |
26 |   keys keys;
   |        ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_keyboard_input.hpp:7,
                 from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:7,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keys.hpp:15:31: error:
     note: 'keys' declared here as 'class pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys'
       15 | class __attribute__((packed)) keys final {
          |                               ^~~~
   |
15 | class __attribute__((packed)) keys final {
   |                               ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:10,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/consumer_input.hpp:23:44: error:
     warning: 'unused' attribute ignored [-Wattributes]
       23 |   uint8_t report_id_ __attribute__((unused));
          |                                            ^
   |
23 |   uint8_t report_id_ __attribute__((unused));
   |                                            ^

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/consumer_input.hpp:26:8: error:
     error: declaration of 'pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::consumer_input::keys' changes meaning of 'keys' [-fpermissive]
       26 |   keys keys;
          |        ^~~~
   |
26 |   keys keys;
   |        ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_keyboard_input.hpp:7,
                 from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:7,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keys.hpp:15:31: error:
     note: 'keys' declared here as 'class pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys'
       15 | class __attribute__((packed)) keys final {
          |                               ^~~~
   |
15 | class __attribute__((packed)) keys final {
   |                               ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:11,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keyboard_input.hpp:24:44: error:
     warning: 'unused' attribute ignored [-Wattributes]
       24 |   uint8_t report_id_ __attribute__((unused));
          |                                            ^
   |
24 |   uint8_t report_id_ __attribute__((unused));
   |                                            ^

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keyboard_input.hpp:27:13: error:
     error: declaration of 'pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::modifiers pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keyboard_input::modifiers' changes meaning of 'modifiers' [-fpermissive]
       27 |   modifiers modifiers;
          |             ^~~~~~~~~
   |
27 |   modifiers modifiers;
   |             ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keyboard_input.hpp:8,
                 from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:11,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/modifiers.hpp:16:31: error:
     note: 'modifiers' declared here as 'class pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::modifiers'
       16 | class __attribute__((packed)) modifiers final {
          |                               ^~~~~~~~~
   |
16 | class __attribute__((packed)) modifiers final {
   |                               ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:11,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keyboard_input.hpp:30:42: error:
     warning: 'unused' attribute ignored [-Wattributes]
       30 |   uint8_t reserved __attribute__((unused));
          |                                          ^
   |
30 |   uint8_t reserved __attribute__((unused));
   |                                          ^

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keyboard_input.hpp:33:8: error:
     error: declaration of 'pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keyboard_input::keys' changes meaning of 'keys' [-fpermissive]
       33 |   keys keys;
          |        ^~~~
   |
33 |   keys keys;
   |        ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/apple_vendor_keyboard_input.hpp:7,
                 from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:7,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/keys.hpp:15:31: error:
     note: 'keys' declared here as 'class pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::keys'
       15 | class __attribute__((packed)) keys final {
          |                               ^~~~
   |
15 | class __attribute__((packed)) keys final {
   |                               ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:15,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/pointing_input.hpp:22:11: error:
     error: declaration of 'pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::buttons pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::pointing_input::buttons' changes meaning of 'buttons' [-fpermissive]
       22 |   buttons buttons;
          |           ^~~~~~~
   |
22 |   buttons buttons;
   |           ^
In file included from /Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver.hpp:9,

/Users/hjalmarjakobsson/code/tools/kmonad/                 from c_src/mac/dext.cpp:3:0: error:

/Users/hjalmarjakobsson/code/tools/kmonad//Users/hjalmarjakobsson/code/tools/kmonad/c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit/virtual_hid_device_driver/hid_report/buttons.hpp:15:31: error:
     note: 'buttons' declared here as 'class pqrs::karabiner::driverkit::virtual_hid_device_driver::hid_report::buttons'
       15 | class __attribute__((packed)) buttons final {
          |                               ^~~~~~~
   |
15 | class __attribute__((packed)) buttons final {
   |                               ^
`gcc' failed in phase `C Compiler'. (Exit code: 1)

--  While building package kmonad-0.4.1 (scroll up to its section to see the error) using:
      /Users/hjalmarjakobsson/.stack/setup-exe-cache/x86_64-osx/Cabal-simple_mPHDZzAJ_3.2.1.0_ghc-8.10.7 --builddir=.stack-work/dist/x86_64-osx/Cabal-3.2.1.0 build lib:kmonad exe:kmonad --ghc-options " -fdiagnostics-color=always"
    Process exited with code: ExitFailure 1
```
