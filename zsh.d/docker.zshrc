#
# init shell env
#
case "${OSTYPE}" in
darwin*)
    eval "$(boot2docker shellinit)"
esac
