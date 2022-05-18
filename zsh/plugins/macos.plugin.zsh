# print the path of the foremost finder
function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

# cd into the directory of the foremost finder
function cdf() {
  cd "$(pfd)"
}

# quick look file
function ql() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}

# Remove .DS_Store files recursively in a directory, default .
function rmdsstore() {
  find "${@:-.}" -type f -name .DS_Store -delete
}

# open current dir in finder
alias finder='open_command $PWD'
