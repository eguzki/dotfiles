#!/usr/bin/env bash

set -e

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

echo ''

CURRENT_PATH="$( cd "$( dirname "$0" )" && pwd )"

source $CURRENT_PATH/helper/logging.sh

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

_logInfo "  Running on $DISTRO"

install_packages

_logInfo "  All installed!"
