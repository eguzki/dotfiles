#!/usr/bin/env bash

set -e

CURRENT_PATH="$( cd "$( dirname "$0" )" && pwd )"

source $CURRENT_PATH/helper/logging.sh
source $CURRENT_PATH/nerd_fonts/functions.sh
source $CURRENT_PATH/nvim/functions.sh
source $CURRENT_PATH/misc/user_defined_bash_functions.sh

echo ''

install_user_defined_bash_functions
install_nerd_font
install_nvim

echo ''
_logInfo "  All installed!"
