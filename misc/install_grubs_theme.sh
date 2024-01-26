#! /usr/bin/env bash

readonly GRUB2_THEME_DIR="/usr/share/grub/themes"
readonly GRUB2_DEFAULT_CONFIG="/etc/default/grub"

install_grub2_theme() {
    if [ -d tartarus ];then
        if [ ! -d ${GRUB2_THEME_DIR} ];then
            mkdir ${GRUB2_THEME_DIR}
        fi
        cp -r tartarus ${GRUB2_THEME_DIR}/
        if grep ^GRUB_THEME ${GRUB2_DEFAULT_CONFIG} > /dev/null 2>&1;then
            sed -i 's/^GRUB_THEME/#&/g' ${GRUB2_DEFAULT_CONFIG}
        fi
        echo 'GRUB_THEME="/usr/share/grub/themes/tartarus/theme.txt"' >> ${GRUB2_DEFAULT_CONFIG}
        grub-mkconfig -o /boot/grub/grub.cfg
    fi
}

main() {
    if [ ${UID} -ne 0 ];then
        echo "need root to run this script"
    fi

    install_grub2_theme
}

main