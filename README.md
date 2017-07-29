# devenv

```
function vim () {
    docker run -ti --rm -v $HOME:$HOME --detach-keys="_" --workdir=$PWD quay.io/andysmith/devenv:latest $@
}
```
