week() {
    cd ~/SYS320-01/ || return

    last_week=$(ls -d week* | sort -V | tail -n 1)

    if [ -d "$last_week" ]; then
        cd "$last_week" || return
        echo "Changed to folder: $last_week"
    else
        echo "No subfolder found."
    fi
}

# https://unix.stackexchange.com/questions/38072/how-can-i-save-the-last-command-to-a-file
getlast() {
    fc -ln "$1" "$1" | sed '1s/^[[:space:]]*//'
}
