OPATH=/tmp/eldrich
GGDB=""
GDBEXEC=""

if [[ $1 == "g" ]]; then
    GGDB="-ggdb3"
    GDBEXEC="gdb -ex r"
    shift
fi

mkdir -p $OPATH

gcc $GGDB interface.c djb2/djb2.amd64.s -o $OPATH/eldint && $GDBEXEC $OPATH/eldint