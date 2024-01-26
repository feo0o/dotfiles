#! /usr/bin/env bash

install_xresources() {
    if [ -f .Xresources ]; then
        cp .Xresources ~/
        return
    fi
    echo ".Xresources not found"
    return 1
}

main() {
    install_xresources
}

main