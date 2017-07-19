# devenv

```
function vim () {
    docker run -ti --rm -v $HOME:$HOME --workdir=$PWD quay.io/andysmith/devenv:latest $@
}
```
