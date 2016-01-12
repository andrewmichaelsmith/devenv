FROM ubuntu:15.10

#Install neovim
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:neovim-ppa/unstable
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y neovim curl git python python-pip

#NeoVim plugins
RUN mkdir -p ~/.config/nvim/autoload ~/.config/nvim/bundle && \
	curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN git clone https://github.com/benekastah/neomake.git \
	/root/.config/nvim/bundle/neomake/

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#Install config
ADD config/vimrc /root/.config/nvim/init.vim

#For python
RUN pip install pylint
