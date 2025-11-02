#!/usr/bin/env fish

#
# CONFIG: INTERACTIVE FISH
#

set -x DOROTHY_THEME "oz"

# load cross shell `sh` files
# source "$DOROTHY/user/config/interactive.sh"

for file in "$DOROTHY/user/sources/"*.fish
    if test -f "$file"
        source "$file"
    end
end

