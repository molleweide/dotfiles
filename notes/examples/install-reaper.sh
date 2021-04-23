#!/bin/sh

# REAPER linux installer
# Copyright (C) 2018 Cockos Incorporated

cd "$(dirname "$0")"
self=$(pwd)/$(basename "$0")
srcpath=$(pwd)/REAPER
uninstall=
uninstall_args=
local_bin=/usr/local/bin/reaper

case "$(basename "$0")" in
	uninstall*)
		srcpath=$(pwd)
		destpath=$(pwd)
		uninstall=1
	;;
esac


# is_root=1 for root, 2 for sudo-available
is_root=0

install_path=
integrate_desktop=
symlink_usr_local_bin=
interactive=1
quiet=

while [ $# -gt 0 ]; do
	case "$1" in
		--quiet)
			quiet=1
		;;
		--integrate-desktop)
			integrate_desktop=1
			interactive=
		;;
		--remove-user-desktop)
			integrate_desktop=2
			interactive=
		;;
		--remove-sys-desktop)
			integrate_desktop=3
			interactive=
		;;
		--integrate-user-desktop)
			integrate_desktop=4
			interactive=
		;;
		--integrate-sys-desktop)
			integrate_desktop=5
			interactive=
		;;
		--usr-local-bin-symlink)
			symlink_usr_local_bin=1
			interactive=
		;;
		--install)
			if [ "$uninstall" != "" ]; then break; fi
			if [ "$install_path" != "" ] || [ $# -lt 2 ]; then break; fi
			install_path="$2"
			interactive=
			shift
		;;
		--uninstall)
			if [ "$uninstall" = "" ]; then break; fi
			uninstall=2
			interactive=
		;;
		*)
		break
		;;
	esac
	shift
done

if [ "$quiet" = "" ]; then
	if [ "$uninstall" != "" ]; then 
		echo "REAPER uninstallation script"
	else
		echo "REAPER installation script"
	fi
	echo "-------------------------------------------------------------------------------"
fi


if [ ! -f "$srcpath/reaper" ]; then
	echo "$srcpath/reaper not found -- please run this script alongside REAPER/."
	exit 1
fi


if [ $# -gt 0 ]; then
	if [ "$uninstall" != "" ]; then 
		echo "usage: $0 [--uninstall] [--quiet]"
	else
		echo "usage: $0 [--install /opt] [--integrate-desktop] [--usr-local-bin-symlink] [--quiet]"
	fi
	echo "  also: --remove-user-desktop --remove-sys-desktop"
	echo "        --integrate-user-desktop --integrate-sys-desktop"
	exit 1
fi

check_root() {
	if [ "$UID" = "0" ] || [ "$(id -ur)" = "0" ]; then
		is_root=1
	else
		which sudo 2>&1 1> /dev/null
		if [ "$?" = "0" ]; then 
			is_root=2; 
		fi
	fi
}


prompt() {
	while true; do
		echo ""
		echo -n "$1"
		read a
		$2 "$a"
		a=$?
		[ "$a" != "0" ] && return "$a";
	done
}

main_menu_list() {
	echo "Available commands:"
	echo "  [V]iew readme-linux.txt and REAPER license agreement"
	echo ""
	echo "  [R]un REAPER from $srcpath/reaper"
	echo ""
	echo "     You can run REAPER without installing it."
	if [ -f "$srcpath/reaper.ini" ]; then
	echo "     All configuration state will be stored in $srcpath/"
	echo "     (If you wish to use ~/.config/REAPER, remove $srcpath/reaper.ini)"
	elif  [ -f ~/.config/REAPER/reaper.ini ]; then
	echo "     Your ~/.config/REAPER/ directory will be used"
	elif  [ -f ~/.REAPER/reaper.ini ]; then
	echo "     Your ~/.REAPER/ directory will be used"
	fi
	echo ""
	echo "  [I]nstall REAPER (you will be prompted for various options)"
	echo ""
	echo "     This install script can put the REAPER program into /opt"
	echo "     or ~/opt, or a path of your choice, and optionally set"
	echo "     up desktop integration (menu items, file associations)."
	echo ""
	echo "  [A]dd desktop integration for $srcpath/reaper"
	echo ""
	echo "     If you've extracted REAPER into the path you would like"
	echo "     it to live in ($srcpath), you can set"
	echo "     up desktop integration (menu items, file associations, "
	echo "     etc) via this action."
}

main_menu() { 
	case "$1" in
		i|I|inst|Inst|INST|install|Install|INSTALL) return 1;;
		a|A|add|Add|ADD) return 2;;
		r|R|run|RUN|Run) return 3;;
		v|V|view|View|VIEW)
				which less 2>&1 1> /dev/null
				if [ "$?" = "0" ]; then 
					cat "$(pwd)/readme-linux.txt" "$(pwd)/REAPER/EULA.txt" | less
				else
					cat "$(pwd)/readme-linux.txt" "$(pwd)/REAPER/EULA.txt" | more
				fi
				echo ""
				main_menu_list
		;;
	esac
	return 0
}

yesno_menu() {
	case "$1" in
		y|Y|yes|YES) return 1;;
		n|N|no|NO) return 2;;
	esac
	return 0
}

install_menu() {
	case "$1" in
		1) 
			if [ "$is_root" = "0" ]; then
				echo ""
				echo "*** path not available, either run as root or install sudo ***"
				return 0
			fi
			install_path="/opt" ; 
			return 1
		;;
		2) 
			if [ "$is_root" = "1" ]; then
				echo ""
				echo "*** installing to home directory not permitted when running as root ***"
				return 0
			fi
			install_path="$HOME/opt" ; 
			return 1;;
		"~") 
			if [ "$is_root" = "1" ]; then
				echo ""
				echo "*** installing to home directory not permitted when running as root ***"
				return 0
			fi
			install_path="$HOME" ; 
			return 1;;
		"~/"*) 
			if [ "$is_root" = "1" ]; then
				echo ""
				echo "*** installing to home directory not permitted when running as root ***"
				return 0
			fi
			install_path="$HOME$(echo "$1" | sed 's/^~//')" ; 
			return 1 ;;
		/*) install_path="$1" ; return 1;;
	esac
	return 0
}

# called with first parameter to do something with directory, second to do something with a file
do_files_un() {
	$1 InstallData/ColorThemes
	$1 InstallData/Data/amp_models
	$1 InstallData/Data/ix_keymaps
	$1 InstallData/Data/IX_scales
	$1 InstallData/Data/ix_scales
	$1 InstallData/Data/IX_sequences
	$1 InstallData/Data/ix_sequences
	$1 InstallData/Data/joystick_midi
	$1 InstallData/Data/seqbaby_data
	$1 InstallData/Data/toolbar_icons/150
	$1 InstallData/Data/toolbar_icons/200
	$1 InstallData/Data/toolbar_icons
	$1 InstallData/Data/track_icons
	$1 InstallData/Data
	$1 InstallData/Effects/analysis
	$1 InstallData/Effects/delay
	$1 InstallData/Effects/dynamics
	$1 InstallData/Effects/filters
	$1 InstallData/Effects/guitar
	$1 InstallData/Effects/ix
	$1 InstallData/Effects/IX
	$1 InstallData/Effects/Liteon
	$1 InstallData/Effects/loopsamplers
	$1 InstallData/Effects/loser
	$1 InstallData/Effects/meters
	$1 InstallData/Effects/midi
	$1 InstallData/Effects/misc
	$1 InstallData/Effects/old_unsupported
	$1 InstallData/Effects/pitch
	$1 InstallData/Effects/remaincalm_org
	$1 InstallData/Effects/schwa
	$1 InstallData/Effects/sstillwell
	$1 InstallData/Effects/synthesis
	$1 InstallData/Effects/Teej
	$1 InstallData/Effects/Till
	$1 InstallData/Effects/utility
	$1 InstallData/Effects/waveshapers
	$1 InstallData/Effects
	$1 InstallData/KeyMaps
	$1 InstallData/MIDINoteNames
	$1 InstallData/OSC
	$1 InstallData/Scripts/Cockos/Default_6.0_theme_adjuster_images
	$1 InstallData/Scripts/Cockos
	$1 InstallData/Scripts
	$1 Plugins/FX
	$1 Plugins/reaper_www_root
	$2 tips.txt
	$2 license.txt
}

do_files() {
	$1 InstallData
	$1 Plugins
	$1 Docs
	$1 Resources

	$2 whatsnew.txt
	$2 EULA.txt
	$2 reaper
	$2 reamote-server
	$2 libSwell.so
	$2 libSwell.colortheme
}

copy_dir() {
	mkdir -p "$destpath/$(dirname "$1")"
	cp -fr -- "$srcpath/$1" "$destpath/$(dirname "$1")" || exit 1
}
copy_file() {
	cp -f -- "$srcpath/$1" "$destpath/$1" || exit 1
}

remove_dir() {
	rm -f -- "$destpath/$1/"*
	rmdir -- "$destpath/$1"
}

remove_file() {
	rm -f -- "$destpath/$1"
}

install_configure() {
	echo ""
	echo "Install REAPER"
	case "$is_root" in
		0)
			echo "  [2] Install to $HOME/opt (in ~/opt/REAPER)"
			echo ""
			echo "  Currently running as a regular user -- if you wish to do a"
			echo "  system-wide install, please run as root (or install sudo)"
			echo ""
			echo "  Or, enter a path starting with / or ~/ to install to that path"
			echo "  (e.g. ~/foo to install into ~/foo/REAPER)"
		;;
		1)
			echo "  [1] Install to /opt (in /opt/REAPER)"
			echo ""
			echo "  Currently running as root -- if you wish to do a user-local"
			echo "  install, please run this installer as a normal user."
			echo ""
			echo "  Or, enter a path starting with / to install to that path."
		;;
		2)
			echo "  [1] Install to /opt (in /opt/REAPER) [will require sudo password entry]"
			echo "  [2] Install to $HOME/opt (in ~/opt/REAPER)"
			echo ""
			echo "  Or, enter a path starting with / or ~/ to install to that path"
			echo "  (e.g. /foo to install into /foo/REAPER, or ~/foo to install into ~/foo/REAPER)"
		;;
	esac
	prompt "Path to install [1,2, or /whatever]: " install_menu

	prompt "Would you like to add desktop integration for this install [Y/N]?: " yesno_menu
	[ "$?" = "1" ] && integrate_desktop=1
	case "$install_path" in
		/home/*) ;;
		*)
			prompt "Would you like to symlink $local_bin to $install_path/REAPER/reaper [Y/N]?: " yesno_menu
			[ "$?" = "1" ] && symlink_usr_local_bin=1
		;;
	esac

	echo ""
	echo ""
	echo "Confirm:"
	echo "  Copy files to: $install_path/REAPER"
	[ "$integrate_desktop" = "1" ]     && echo "  + Perform desktop integration for $install_path/REAPER/reaper"
	[ "$symlink_usr_local_bin" = "1" ] && echo "  + Symlink $local_bin to $install_path/REAPER/reaper"
	prompt "Proceed with installation [Y/N]?: " yesno_menu
	if [ "$?" != "1" ]; then
		echo "Installation aborted. No changes have been made."
		exit 1
	fi
}

if [ "$interactive" != "" ]; then
	if [ "$uninstall" != "" ]; then
		check_root

		echo "Installation path: $srcpath"
		prompt "Would you like to remove REAPER from this path? [Y/N] " yesno_menu
		if [ "$?" != "1" ]; then
			echo "Uninstallation aborted. No changes have been made."
			exit 1
		fi
		prompt "Would you like to remove desktop integration [Y/N] " yesno_menu

		if [ "$?" = "1" ]; then
			case "$srcpath" in
				/home/*) integrate_desktop=2 ;;
				*) 
					if [ "$is_root" = "1" ]; then
						integrate_desktop=3
					else
						integrate_desktop=6
					fi
				;;
			esac
		fi
		uninstall=2

		if [ "$is_root" = "2" ]; then
			tmp_txt="$destpath/reaper-uninstaller-tmp.txt"
			touch "$tmp_txt" 2> /dev/null
			if [ ! -f "$tmp_txt" ]; then
				if [ "$integrate_desktop" != "" ]; then
					uninstall_args="$uninstall_args --remove-sys-desktop"
					integrate_desktop=2
				fi
				uninstall=3
			else
				rm -- "$tmp_txt"
			fi
		fi
	else
		check_root

		main_menu_list
		prompt "Command [V,R,I,A]: " main_menu
		case "$?" in
			3)
				if [ ! -f "$srcpath/reaper.ini" ] && [ ! -f ~/.config/REAPER/reaper.ini ] && [ ! -f ~/.REAPER/reaper.ini ]; then
					echo ""
					echo "Running REAPER from $srcpath:"
					echo ""
					echo "Would you like to run REAPER without creating any files"
					echo "in ~/.config/REAPER? This will make your REAPER configuration"
					echo "entirely contained in $srcpath."
					prompt "Would you like to create a portable install in $srcpath [Y/N] " yesno_menu
					if [ "$?" = "1" ]; then
						touch "$srcpath/reaper.ini"
					fi
				fi
				echo "Launching $srcpath/reaper..."
				$srcpath/reaper
				exit 0
			;;
			2) integrate_desktop=1 ;;
			1) install_configure ;;
		esac
	fi
fi

if [ "$install_path" != "" ]; then
	if [ "$quiet" = "" ]; then
		echo "REAPER installer -- install to $install_path"
		echo ""
	fi
	destpath="$install_path/REAPER"
	mkdir -p "$destpath" 2> /dev/null
	tmp_txt="$destpath/reaper-installer-tmp.txt"
	touch "$tmp_txt" 2> /dev/null
	if [ ! -f "$tmp_txt" ]; then
		if [ "$is_root" = "2" ]; then
			args=" --quiet"
			[ "$integrate_desktop" = "1" ] && args="$args --integrate-desktop"
			[ "$symlink_usr_local_bin" = "1" ] && args="$args --usr-local-bin-symlink"
			echo ""
			echo "Could not write to $destpath, trying sudo:"
			echo "  sudo sh \"$self\" --install \"$install_path\"$args"
			sudo sh "$self" --install "$install_path"$args
			exit "$?"
		fi
		echo "Error: could not write to $destpath"
		if [ "$is_root" != "1" ]; then
			echo ""
			echo "Please re-run as root, run directly, or try installing to ~/opt."
		fi
		exit 1;
	fi
	rm -- "$tmp_txt"

	echo -n "Cleaning up destination..."
        remove_dir InstallData/Effects/ix
        remove_dir InstallData/Data/IX_scales
        remove_dir InstallData/Data/IX_sequences
	echo " done"

	echo -n "Copying files..."
	do_files copy_dir copy_file
	echo " done"

	echo "Writing uninstall script to $destpath/uninstall-reaper.sh"
	cp -f -- "$self" "$destpath/uninstall-reaper.sh"
	chmod +x "$destpath/uninstall-reaper.sh"
else
	destpath="$srcpath"
fi

########## symlink installation

if [ "$symlink_usr_local_bin" = "1" ]; then
	if [ -f "$local_bin" ] && ! readlink "$local_bin" >/dev/null ; then
		echo "$local_bin exists and is not a symlink -- not creating a link"
	else
		echo -n "Creating symlink from $destpath/reaper to $local_bin..."
		ln -sf "$destpath/reaper" $local_bin && echo "done";
		echo ""
	fi
fi


########## desktop integration installation

make_desktop_item() {
	echo "[Desktop Entry]"
	echo "Encoding=UTF-8"
	echo "Type=Application"
	while [ $# -gt 0 ]; do echo "$1"; shift; done
}

install_desktop() {
	echo -n "$3"
	tmpdir=$(mktemp -d -t reaper-installXXXX)

	if [ "$1" = "uninstall" ]; then
		xdg-desktop-menu uninstall $2 cockos-reaper.directory \
			"cockos-reaper-audiocfg.desktop" "cockos-reaper.desktop" "cockos-reaper-license.desktop" \
			"cockos-reaper-new.desktop" "cockos-reaper-reamote.desktop" "cockos-reaper-whatsnew.desktop"

		for a in cockos-reaper cockos-reamote \
			cockos-reaper-backup cockos-reaper-document cockos-reaper-theme \
			cockos-reaper-peak cockos-reaper-template cockos-reaper-template2; do
			xdg-icon-resource uninstall $2 --size 256 $a
		done

		xdg-desktop-menu uninstall $2 cockos-reaper.desktop
	else

		make_desktop_item \
		"Name=REAPER" \
		"Comment=REAPER" \
		"Categories=Audio;Video;AudioVideo;AudioVideoEditing;Recorder;" \
		"Exec=\"$destpath/reaper\" %F" \
		"Icon=cockos-reaper" \
		"MimeType=application/x-reaper-project;application/x-reaper-project-backup;application/x-reaper-theme" \
		"StartupWMClass=REAPER" \
		> "$tmpdir/cockos-reaper.desktop"

		xdg-icon-resource install $2 --size 256 "$srcpath/Resources/main.png" cockos-reaper
		xdg-icon-resource install $2 --size 256 "$srcpath/Resources/reamote.png" cockos-reamote
		for a in \
			cockos-reaper-backup cockos-reaper-document cockos-reaper-theme \
			cockos-reaper-peak cockos-reaper-template cockos-reaper-template2; do
			xdg-icon-resource install $2 --size 256 "$srcpath/Resources/$a.png" $a
		done

		xdg-desktop-menu install $2 "$tmpdir/cockos-reaper.desktop" 
	 	rm -f -- "$tmpdir/cockos-reaper.desktop"
	fi


	cat << EOF > "$tmpdir/application-x-reaper.xml"
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-reaper-project">
    <sub-class-of type="text/plain"/>
    <comment xml:lang="en">REAPER project</comment>
    <icon name="cockos-reaper-document"/>
    <glob pattern="*.rpp"/>
  </mime-type>
  <mime-type type="application/x-reaper-project-backup">
    <sub-class-of type="text/plain"/>
    <comment xml:lang="en">REAPER project backup</comment>
    <icon name="cockos-reaper-backup"/>
    <glob pattern="*.rpp-bak"/>
  </mime-type>
  <mime-type type="application/x-reaper-config">
    <sub-class-of type="text/plain"/>
    <icon name="cockos-reaper"/>
    <comment xml:lang="en">REAPER configuration</comment>
    <glob pattern="reaper*.ini"/>
  </mime-type>
  <mime-type type="application/x-reaper-fxchain">
    <sub-class-of type="text/plain"/>
    <comment xml:lang="en">REAPER fx chain</comment>
    <icon name="cockos-reaper-template"/>
    <glob pattern="*.rfxchain"/>
  </mime-type>
  <mime-type type="application/x-reaper-tracktemplate">
    <sub-class-of type="text/plain"/>
    <comment xml:lang="en">REAPER track template</comment>
    <icon name="cockos-reaper-template2"/>
    <glob pattern="*.RTrackTemplate"/>
  </mime-type>
  <mime-type type="application/x-reaper-theme">
    <comment xml:lang="en">REAPER theme</comment>
    <icon name="cockos-reaper-theme"/>
    <glob pattern="*.ReaperTheme"/>
    <glob pattern="*.ReaperThemeZip"/>
  </mime-type>
  <mime-type type="application/x-reaper-undo">
    <icon name="cockos-reaper-backup"/>
    <comment xml:lang="en">REAPER undo</comment>
    <glob pattern="*.rpp-undo"/>
  </mime-type>
  <mime-type type="application/x-reaper-bak-undo">
    <icon name="cockos-reaper-backup"/>
    <comment xml:lang="en">REAPER undo backup</comment>
    <glob pattern="*.rpp-bak-undo"/>
  </mime-type>
  <mime-type type="application/x-reaper-peak">
    <comment xml:lang="en">REAPER peak file</comment>
    <icon name="cockos-reaper-peak"/>
    <glob pattern="*.reapeaks"/>
  </mime-type>
  <mime-type type="application/x-reaper-proxy">
    <icon name="cockos-reaper-peak"/>
    <comment xml:lang="en">REAPER proxy</comment>
    <glob pattern="*.rpp-prox"/>
  </mime-type>
</mime-info>
EOF
	xdg-mime $1 $2 "$tmpdir/application-x-reaper.xml"

	rm -f -- "$tmpdir/application-x-reaper.xml"

	rmdir -- "$tmpdir"

	which kbuildsycoca5 2>&1 1> /dev/null
	if [ "$?" = "0" ]; then 
		kbuildsycoca5
	else
		which kbuildsycoca4 2>&1 1> /dev/null
		if [ "$?" = "0" ]; then 
			kbuildsycoca4
		fi
	fi
	echo " done";
}


case "$integrate_desktop" in
	1) install_desktop "install" "" "Installing desktop integration..." ;;
	2) install_desktop "uninstall" "--mode user" "Uninstalling desktop integration for user..." ;;
	3) install_desktop "uninstall" "--mode system" "Uninstalling desktop integration for system..." ;;
	4) install_desktop "install" "--mode user" "Installing desktop integration for user..." ;;
	5) install_desktop "install" "--mode system" "Installing desktop integration for system..." ;;
	6)
		install_desktop "uninstall" "--mode user" "Uninstalling desktop integration for user..."
		install_desktop "uninstall" "--mode system" "Uninstalling desktop integration for system..."
	;;
esac

case "$uninstall" in
	3)
		echo ""
		echo "Unable to write to $destpath, trying sudo:"
		echo "  sudo sh \"$self\" --uninstall --quiet$uninstall_args"
		sudo sh "$self" --uninstall --quiet$uninstall_args
	;;
	2)
		if [ "$(readlink $local_bin)" = "$destpath/reaper" ]; then
			echo "Removing symlink of $local_bin to $destpath/reaper"
			rm -f $local_bin
		fi

		echo -n "Removing files..."
		do_files_un remove_dir remove_file
		do_files remove_dir remove_file
		rm -f -- "$destpath/uninstall-reaper.sh"
		echo " done"
		rmdir -- "$destpath"
		echo ""

		echo " *** Uninstallation complete"
	;;
esac

if [ "$install_path" != "" ]; then
	echo ""
	echo " *** Installation complete";
fi
