FROM ubuntu:17.10
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vim git build-essential curl python-isort && \
    apt-get install -y python3-pip && \
    pip3 install pylint && pip3 install --upgrade  && \
    pip3 install flake8 isort autopep8 && \
    apt-get install -y ncurses-dev && \
    rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /root/.config/
ADD config/vimrc /root/.vimrc
ADD config/flake8 /root/.config/flake8
ADD config/after-ftplugin-python.vim /root/.vim/after/ftplugin/python.vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    vim -c ":PlugInstall | :qa"

ENTRYPOINT ["vim"]
