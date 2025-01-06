# cd with ls
function cl() {
    DIR="$*";
        # if no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

# kill port
function portkill() {
  lsof -nti :$1 | xargs kill -9
}
# ------------------- PORT UTILTIES ----------------------
# Find PID of process on a specific port
# param portNumber
# example: "findPortProcess 8080"
findPortProcess() {
    portProcess="$(lsof -n -i4TCP:$1 | grep LISTEN)"
    if [ "$portProcess" ]
    then
        echo $portProcess
    else
        echo "No Process on Port:$1"
    fi
}

# Kills Process on a Port
# param portNumber
# example: "killPort 8080"
killPort() {
    processPID="$(lsof -ti tcp:$1)"
    if [ "$processPID" ]
    then
        kill $processPID
        echo "Killed Process on Port:$1"
    else
        echo "No Process on Port:$1"
    fi

}

# unarchive
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1     ;;
            *.tar.gz)   tar xvzf $1     ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xvf $1      ;;
            *.tbz2)     tar xvjf $1     ;;
            *.tgz)      tar xvzf $1     ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *)          echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
