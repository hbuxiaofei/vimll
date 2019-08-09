#!/bin/bash

cd $(dirname $0)

if [ -f /etc/vim/vimrc ] && [ ! -f /etc/vim/vimrc.bak]; then
    mv /etc/vim/vimrc /etc/vim/vimrc.bak
    touch /etc/vim/vimrc
fi

if [ -f /etc/vimrc ] && [ ! -f /etc/vimrc.bak]; then
    mv /etc/vimrc /etc/vimrc.bak
    touch /etc/vimrc
fi

rm -rf /root/.vim >/dev/null 2>&1
rm -f /root/.vimrc >/dev/null 2>&1
cp -rf vim /root/.vim
cp -f vimrc /root/.vimrc

echo -e "\033[32m- Install successfully...\033[0m"
exit 0
