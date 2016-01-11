build:
	docker build -t dev .

run:
	docker run --rm -v `pwd`:/vol --workdir=/vol -ti dev nvim

