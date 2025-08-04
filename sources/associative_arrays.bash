source "$DOROTHY/sources/bash.bash"

# WARNING: this is a bit stupid because you should ideally use the latest
# version...

# NOTE: Something like the below, BUT the below code is incorrect.

gen_unique_name() {
    echo "_mytool_array_$(uuidgen | tr -d '-')"
}

__dict() {
    local __resultvar="$1"
    local name
    name=$(gen_unique_name)

    if declare -A internal__check_availability &>/dev/null; then
        echo "-A is supported"

        declare -g -A "$name" # Create global associative hidden array

    eval "$__resultvar='$name'"
    else
        echo "-A NOT supported (legacy)"

        # TODO: Legacy: Create the mapping of key/value with global
        # declare -g "$name"

        declare -g "$target_key"
        declare -g "$target_value"

        # assign the key/values
    eval "$__resultvar='$name'"
    eval "$__resultvar='$name'"
    fi

}

# ensure that it works with (...) as well
main() {
    local array_somename
    __dict array_name

    local -n arr_ref="$array_somename"
    arr_ref["foo"]="bar"
    echo "${arr_ref[foo]}"
}
