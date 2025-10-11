#!/usr/bin/env bash

set -e

CURRENT_PATH="$( cd "$( dirname "$0" )" && pwd )"

echo ''

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

DISTRO=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')

case "$DISTRO" in
    "Ubuntu")
        source $CURRENT_PATH/system/ubuntu/functions
        ;;

    "Fedora Linux")
        source $CURRENT_PATH/system/fedora/functions
        ;;

    *)
        echo "Unknown distro: $DISTRO" 1>&2
        exit 1
        ;;
esac

echo "  Running on $DISTRO"

install_packages

echo '  All installed!'
