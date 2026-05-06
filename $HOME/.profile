# setup a safe wrapper for sourcing files to protect angainst accidental shell crashing
safe_source() {
    local file=$1
    local rc

    [[ -f "$file" ]] || return 0

    if ! bash -n "$file"; then
        echo "syntax error in $file" >&2
        return 1
    fi

    exit() { echo "WARNING: exit called in $file (ignored, please fix)" >&2; return 1; }
    exec() { echo "WARNING: exec called in $file (ignored, please fix)" >&2; return 1; }

    if [ -n "$ZSH_VERSION" ]; then
        setopt LOCAL_OPTIONS NO_ERR_EXIT NO_UNSET NO_PIPE_FAIL
        source "$file"
    else
        set +e +u +o pipefail
        . "$file"
    fi

    rc=$?

    unset -f exit exec
    return $rc
}

# set PATH so it includes user's private bin if it exists

if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Source all files in ~/.local/etc/profile.d
SRC_FILES="$(find $HOME/.local/profile.d -type f -not -name '.*')"
for PROFILE_SRC in $SRC_FILES
do
	# note: source command does not work in for-loops in bash
	safe_source "$PROFILE_SRC" || echo "$PROFILE_SRC failed" >&2
done

