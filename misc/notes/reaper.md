# DOTF RPP NOTES

1. make sure reaper works on intel mac.
    test reaper623
        make sure reaper keys work
    test reaper 625
    duplicate reaper 625 -> dir RPP_LATEST
        rename app and dir to RPP_LATEST

3. make latest version into `RPP_LATEST`

5. update reaper script to use `RPP_LATEST`
    check is_mac && intel/silicone????

5. test this on intel
    supply argument >> install dir

6. install on M1

7. reaper cli?
    add rpp_latest to path

8. check reaper version in RPP_LATEST
    if there is a new version of reaper.
    rename local versions to their corresponding version number
    install latest to reaper

9. add reaper repos to personal/stuff

10. put reaper keys under code
    symlink back into reaper_osx

11. create git hook > check if new version exists
    NOTE: <<< GIT PULL HOOK >>>
    check if new reaper version exists
    if true

        mv rpp_latest.app rpp_{current-version}
        git checkout -b rpp-{current-version}
        cd ..
        mv rpp_latest_dir rpp_{current-version}

        download latest reaper version into rpp_latest_dir
        git clone rpp_latest into rpp_latest_dir
        >>> allow reaper latest version to update necessary options accordingly

        done

        now previos version exists in rpp_prev_version
        latest reaper exists in rpp_latest


QUESTIONS

1. do I need to maintain two separate reaper config branches
    one for intel mac and another for silicone mac??
    ie. git branch `rpp_macos_intel`and `rpp_macos_arm`

2. do I have to consider having different config branches for mac vs linux??

3. How to maintain multiple versions of reaper?
    
