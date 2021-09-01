#!/usr/bin/env bash

installer_download() {
    local url=$1
    local filename=$2
    local output_path="/tmp/${filename}"

    curl -L "$url" -o "$output_path"

    echo $output_path
    return 0
}

mount_dmg() {
    local dmg_path=$1
    local mount_path=$(
	(yes | hdiutil attach -noautoopen "$dmg_path") | \
	    grep 'Volumes' |
	    awk '{ n=split($0, a, /[[:space:]]{2,}/); print a[n] }'
    )

    echo "$mount_path"
    return 0
}

unmount_dmg() {
    hdiutil detach "$1" >/dev/null
}

app_installed() {
    test -e "/Applications/$1.app"
}

run_program_and_wait() {
    local installer_path=$1
    open -W "$installer_path"
}

run_installer_pkg() {
    local pkg_path=$1
    sudo installer -pkg "$pkg_path" -target /
}

downloading_msg() {
    dotsay "@b@blue[[+ Downloading and installing $1]]"
}

already_installed_msg() {
    dotsay "+ $name already installed"
}

install_dmg_with_installer() {
    local name=$1
    local url=$2
    local installer_path=$3

    if ! app_installed "$name"; then
        dotsay "@blue@b[[+ Installing $name]]"

        downloading_msg "$name"

        local dmg_path=$(installer_download "$url" "$name.dmg")
        local mount_path=$(mount_dmg "$dmg_path")

        run_program_and_wait "$mount_path/$installer_path"

        unmount_dmg "$mount_path"
        rm -fr $dmg_path
    else
        already_installed_msg "$name"
    fi
}

install_simple_dmg_copy() {
    local name=$1
    local url=$2

    if ! app_installed "$name"; then
        dotsay "@blue@b[[+ Installing $name]]"

        local dmg_path=$(installer_download "$url" "$name.dmg")
        local mount_path=$(mount_dmg "$dmg_path")
        local app_to_copy="$mount_path/$name.app"

        cp -r "$app_to_copy" /Applications

        unmount_dmg "$mount_path"
        rm -fr $dmg_path
    else
        already_installed_msg "$name"
    fi
}

install_zip_installer() {
    local name=$1
    local installer=$2
    local url=$3

    if ! app_installed "$name"; then
        dotsay "@blue@b[[+ Installing $name]]"

        local zip_path=$(installer_download "$url" "$name.zip")
        unzip -d /tmp "$zip_path"
        open "/tmp/$installer"
    else
        already_installed_msg "$name"
    fi
}

install_simple_zip() {
    local name=$1
    local url=$2

    if ! app_installed "$name"; then
        dotsay "@blue@b[[+ Installing $name]]"

        local zip_path=$(installer_download "$url" "$name.zip")

        unzip -d /Applications "$zip_path"

        rm -fr $zip_path
    else
        already_installed_msg "$name"
    fi
}

install_inception_zip() {
    local name=$1
    local url=$2

    if ! app_installed "$name"; then
        dotsay "@blue@b[[+ Installing $name]]"

        local zip_path=$(installer_download "$url" "$name.zip")
        local tmp_directory=$(mktemp -d -t 'dotfiles')

        unzip -d "$tmp_directory" "$zip_path" >/dev/null

        dmg_path=$(
        find -E "$tmp_directory" \
            -not -path '*/\.*' \
            -iregex "\/[[:alpha:][:digit:]]+.*\.dmg$"
        )

        local mount_path=$(mount_dmg "$dmg_path")
        local app_to_copy="$mount_path/$name.app"

        cp -r "$app_to_copy" /Applications

        unmount_dmg "$mount_path"

        rm -fr $zip_path
        rm -fr $tmp_directory
    else
        already_installed_msg "$name"
    fi
}

install_pkg() {
    local name=$1
    local url=$2

    if ! app_installed "$name"; then
        local pkg_path=$(installer_download "$url" "$name.pkg")

        run_installer_pkg "$pkg_path"
        rm -fr $pkg_path
    else
        already_installed_msg "$name"
    fi
}
