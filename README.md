# devenv
vim () {
	docker run -ti --rm -v $HOME:$HOME -e PWD=$PWD quay.io/andysmith/devenv sh -c "cd $PWD && exec vim $1"
}


