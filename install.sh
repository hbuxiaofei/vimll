#!/bin/bash

USRLOCAL_BIN=/usr/local/bin
export PATH=$USRLOCAL_BIN:$PATH

INSTALL_HOME=$HOME
[ -n "$SUDO_USER" ] && INSTALL_HOME=/home/$SUDO_USER

cd $(dirname $0)

echo -e "\033[32m- [Info] Start to copy files\033[0m"


if [ -f /etc/vim/vimrc ] && [ ! -f /etc/vim/vimrc.bak ]; then
    mv /etc/vim/vimrc /etc/vim/vimrc.bak
    touch /etc/vim/vimrc
fi

if [ -f /etc/vimrc ] && [ ! -f /etc/vimrc.bak ]; then
    mv /etc/vimrc /etc/vimrc.bak
    touch /etc/vimrc
fi

rm -rf /${INSTALL_HOME}/.vim >/dev/null 2>&1
rm -f /${INSTALL_HOME}/.vimrc >/dev/null 2>&1
cp -rf vim /${INSTALL_HOME}/.vim
cp -f vimrc /${INSTALL_HOME}/.vimrc


echo -e "\033[32m- [Info] Install successfully...\033[0m"

exit 0
