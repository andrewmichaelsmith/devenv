FROM ubuntu:16.04
RUN apt-get update && apt-get upgrade -y

## Core ##
RUN apt-get install -y git build-essential curl

## PYTHON2 Setup ##
RUN apt-get install -y python-pip
RUN pip install pylint && pip install --upgrade pip

## VIM Setup ##
RUN apt-get install -y ncurses-dev

RUN cd /tmp && \
	git clone https://github.com/vim/vim.git && \
	cd vim && \
	make && \
	make install && \
	cd ~ && \
	rm -rf /tmp/vim/

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD config/vimrc /root/.vimrc
RUN vim -c ":PlugInstall | :qa"



CMD vim
