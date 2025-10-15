#!/usr/bin/env bash

set -e

CURRENT_PATH="$( cd "$( dirname "$0" )" && pwd )"
HOME_CONFIG=$HOME/.config

source $CURRENT_PATH/helper/logging.sh
source $CURRENT_PATH/user/nerd_fonts/functions.sh
source $CURRENT_PATH/user/nvim/functions.sh
source $CURRENT_PATH/user/fzf/functions.sh
source $CURRENT_PATH/user/ripgrep/functions.sh
source $CURRENT_PATH/user/misc/user_defined_bash_functions.sh
source $CURRENT_PATH/user/misc/local_bin.sh
source $CURRENT_PATH/user/gitconfig/functions.sh

echo ''

install_user_defined_bash_functions
install_local_bin
install_gitconfig
install_nerd_font
install_fzf
install_ripgrep
install_nvim

echo ''
_logInfo "  All installed!"
