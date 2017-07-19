FROM ubuntu:16.04
RUN apt-get update && apt-get upgrade -y

RUN mkdir -p /root/.config/
ADD config/vimrc /root/.vimrc
ADD config/after-ftplugin-python.vim /root/.vim/after/ftplugin/python.vim
ADD config/flake8 /root/.config/flake8

RUN apt-get install -y git build-essential curl && \
    apt-get install -y python3-pip && \
    pip3 install pylint && pip3 install --upgrade  && \
    pip3 install flake8 && \
    apt-get install -y ncurses-dev && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    make && \
    make install && \
    cd ~ && \
    rm -rf /tmp/vim/ && \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    vim -c ":PlugInstall | :qa"

ENTRYPOINT ["vim"]
