#!/usr/bin/env bash

set -e

CURRENT_PATH="$( cd "$( dirname "$0" )" && pwd )"

source $CURRENT_PATH/helper/logging.sh
source $CURRENT_PATH/nerd_fonts/functions
source $CURRENT_PATH/nvim/functions

echo ''

install_nerd_font
install_nvim

echo ''
_logInfo "  All installed!"
