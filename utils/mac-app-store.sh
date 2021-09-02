#!/usr/bin/env bash

mas_app_id() {
    local name=$1

    mas search "$name" | awk '{ print $1 }'
}

mas_install() {
    local name=$1
    local app_id=$2

    if ! mas list | grep -q $app_id; then
        dotsay "@b@yellow[[+ installing $name]]"
        mas install $app_id
    else
        dotsay "+ $name already installed"
    fi
}

mas_ensure_signed_in() {
    if ! mas account >/dev/null 2>&1; then
	    printf "What is your Apple ID? > "
	    read apple_id
	    mas signin $apple_id
    else
	    dotsay "@b@blue[[Currently signed into the App Store as $(mas account)]]"
    fi
}
