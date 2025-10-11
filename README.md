# dotfiles

My environment

## Install

```
git clone https://github.com/eguzki/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sudo bash install_system.sh
bash install_user.sh
```

## Development

### Ubuntu

```
docker build -f Dockerfile.ubuntu -t myubuntu .
docker run --rm -ti -v $PWD:/home/apprunner/dotfiles myubuntu /bin/bash
```

### Fedora

```
docker build -f Dockerfile.fedora -t myfedora .
docker run --rm -ti -v $PWD:/home/apprunner/dotfiles myfedora /bin/bash
```
