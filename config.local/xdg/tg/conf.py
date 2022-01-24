import os

# GITHUB: https://github.com/paul-nameless/tg
# CONFIG: https://github.com/paul-nameless/tg/blob/master/tg/config.py

# # You can write anything you want here, file will be executed at start time
# # You can keep you sensitive information in password managers or gpg
# # encrypted files for example
# def get_pass(key):
#     # retrieves key from password store
#     return os.popen("pass show {} | head -n 1".format(key)).read().strip()


PHONE = os.environ["PHONE_NUMBER"]

# # encrypt you local tdlib database with the key
# ENC_KEY = get_pass("i/telegram-enc-key")

# # log level for debugging, info by default
# LOG_LEVEL = "DEBUG"
# # path where logs will be stored (all.log and error.log)
# LOG_PATH = os.path.expanduser("~/.local/share/tg/")

# # If you have problems with tdlib shipped with the client, you can install and
# # use your own, for example:
# TDLIB_PATH = "/usr/local/Cellar/tdlib/1.6.0/lib/libtdjson.dylib"

# # you can use any other notification cmd, it is simple python string which
# # can format title, msg, subtitle and icon_path paramters
# # In these exapmle, kitty terminal is used and when notification is pressed
# # it will focus on the tab of running tg
# NOTIFY_CMD = "/usr/local/bin/terminal-notifier -title {title} -subtitle {subtitle} -message {msg} -appIcon {icon_path} -sound default -execute '/Applications/kitty.app/Contents/MacOS/kitty @ --to unix:/tmp/kitty focus-tab --no-response -m title:tg'"

# # You can use your own voice recording cmd but it's better to use default one.
# # The voice note must be encoded with the Opus codec, and stored inside an OGG
# # container. Voice notes can have only a single audio channel.
# VOICE_RECORD_CMD = "ffmpeg -f avfoundation -i ':0' -c:a libopus -b:a 32k {file_path}"

# # You can customize chat and msg flags however you want.
# # By default words will be used for readability, but you can make
# # it as simple as one letter flags like in mutt or add emojies
# CHAT_FLAGS = {
#     "online": "●",
#     "pinned": "P",
#     "muted": "M",
#     # chat is marked as unread
#     "unread": "U",
#     # last msg haven't been seen by recipient
#     "unseen": "✓",
#     "secret": "🔒",
#     "seen": "✓✓",  # leave empty if you don't want to see it
# }
# MSG_FLAGS = {
#     "selected": "*",
#     "forwarded": "F",
#     "new": "N",
#     "unseen": "U",
#     "edited": "E",
#     "pending": "...",
#     "failed": "💩",
#     "seen": "✓✓",  # leave empty if you don't want to see it
# }

# # use this app to open url when there are multiple
# URL_VIEW = 'urlview'

# # Specifies range of colors to use for drawing users with
# # different colors
# # this one uses base 16 colors which should look good by default
# USERS_COLORS = tuple(range(2, 16))

# # to use 256 colors, set range appropriately
# # though 233 looks better, because last colors are black and gray
# # USERS_COLORS = tuple(range(233))

# # to make one color for all users
# # USERS_COLORS = (4,)

# # cleanup cache
# # Values: N days, None (never)
# KEEP_MEDIA = 7

# FILE_PICKER_CMD = "ranger --choosefile={file_path}"
# # FILE_PICKER_CMD = "nnn -p {file_path}"

# MAILCAP_FILE = os.path.expanduser("~/.config/mailcap")

# DOWNLOAD_DIR = os.path.expanduser("~/Downloads/")  # copy file to this dir



###########################################################
###########################################################
###########################################################



# """
# Every parameter (except for CONFIG_FILE) can be
# overwritten by external config file
# """
# import os
# import platform
# import runpy
# from typing import Dict, Optional

# _os_name = platform.system()
# _darwin = "Darwin"
# _linux = "Linux"


# CONFIG_DIR = os.path.expanduser("~/.config/tg/")
# CONFIG_FILE = os.path.join(CONFIG_DIR, "conf.py")
# FILES_DIR = os.path.expanduser("~/.cache/tg/")
# MAILCAP_FILE: Optional[str] = None

# LOG_LEVEL = "INFO"
# LOG_PATH = os.path.expanduser("~/.local/share/tg/")

# API_ID = "559815"
# API_HASH = "fd121358f59d764c57c55871aa0807ca"

# PHONE = None
# ENC_KEY = ""

# TDLIB_PATH = None
# TDLIB_VERBOSITY = 0

# MAX_DOWNLOAD_SIZE = "10MB"

# # TODO: check platform
# NOTIFY_CMD = "/usr/local/bin/terminal-notifier -title {title} -subtitle {subtitle} -message {msg} -appIcon {icon_path}"

# VIEW_TEXT_CMD = "less"
# FZF = "fzf"

# if _os_name == _linux:
#     # for more info see https://trac.ffmpeg.org/wiki/Capture/ALSA
#     VOICE_RECORD_CMD = (
#         "ffmpeg -f alsa -i hw:0 -c:a libopus -b:a 32k {file_path}"
#     )
# else:
#     VOICE_RECORD_CMD = (
#         "ffmpeg -f avfoundation -i ':0' -c:a libopus -b:a 32k {file_path}"
#     )

# # TODO: use mailcap instead of editor
# LONG_MSG_CMD = "vim + -c 'startinsert' {file_path}"
# EDITOR = os.environ.get("EDITOR", "vi")

# if _os_name == _linux:
#     DEFAULT_OPEN = "xdg-open {file_path}"
# else:
#     DEFAULT_OPEN = "open {file_path}"

# if _os_name == _linux:
#     if os.environ.get("WAYLAND_DISPLAY"):
#         COPY_CMD = "wl-copy"
#     else:
#         COPY_CMD = "xclip -selection c"
# else:
#     COPY_CMD = "pbcopy"

# CHAT_FLAGS: Dict[str, str] = {}

# MSG_FLAGS: Dict[str, str] = {}

# ICON_PATH = os.path.join(os.path.dirname(__file__), "resources", "tg.png")

# URL_VIEW = "urlview"

# USERS_COLORS = tuple(range(2, 16))

# KEEP_MEDIA = 7

# FILE_PICKER_CMD = "ranger --choosefile={file_path}"

# DOWNLOAD_DIR = os.path.expanduser("~/Downloads/")

# if os.path.isfile(CONFIG_FILE):
#     config_params = runpy.run_path(CONFIG_FILE)  # type: ignore
#     for param, value in config_params.items():
#         if param.isupper():
#             globals()[param] = value
# else:
#     os.makedirs(CONFIG_DIR, exist_ok=True)

#     if not PHONE:
#         print(
#             "Enter your phone number in international format (including country code)"
#         )
#         PHONE = input("phone> ")
#         if not PHONE.startswith("+"):
#             PHONE = "+" + PHONE

#     with open(CONFIG_FILE, "w") as f:
#         f.write(f"PHONE = '{PHONE}'\n")
