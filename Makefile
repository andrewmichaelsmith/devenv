build:
	docker build -t dev .

run:
	docker run --rm -v ${HOME}:${HOME} --workdir=${HOME} -ti dev 

