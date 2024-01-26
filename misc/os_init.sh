#! /usr/bin/env bash

# todo: install network-manager and setup /etc/ntework/interfaces

install_pkgs() {
    apt-get install -y lightdm awesome picom x11-utils breeze-cursor-theme zsh git neovim apt-file
}

main() {
    if [ $UID -ne 0 ];then
        echo "need root to run this script"
    fi

    install_pkgs
}

main