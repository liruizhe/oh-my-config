#!/bin/bash

if [ -d ~/.oh-my-config ]
then
	exit
fi

hash git > /dev/null && /usr/bin/env git clone https://github.com/liruizhe/oh-my-config.git ~/.oh-my-config || {
	echo -e "git not installed"
	exit
}

cd ~/.oh-my-config
git submodule init
git submodule update
