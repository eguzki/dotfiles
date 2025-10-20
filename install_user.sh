#!/usr/bin/env bash

set -e

CURRENT_PATH="$( cd "$( dirname "$0" )" && pwd )"
HOME_CONFIG=$HOME/.config

source $CURRENT_PATH/helper/logging.sh
source $CURRENT_PATH/user/nerd_fonts/functions.sh
source $CURRENT_PATH/user/nvim/functions.sh
source $CURRENT_PATH/user/fd/functions.sh
source $CURRENT_PATH/user/fzf/functions.sh
source $CURRENT_PATH/user/ripgrep/functions.sh
source $CURRENT_PATH/user/misc/user_defined_bash_functions.sh
source $CURRENT_PATH/user/misc/local_bin.sh
source $CURRENT_PATH/user/gitconfig/functions.sh
source $CURRENT_PATH/user/yq/functions.sh
source $CURRENT_PATH/user/jq/functions.sh
source $CURRENT_PATH/user/gcloud/functions.sh
source $CURRENT_PATH/user/go/functions.sh
source $CURRENT_PATH/user/starship/functions.sh
source $CURRENT_PATH/user/gh/functions.sh
source $CURRENT_PATH/user/kubectl/functions.sh

echo ''

install_user_defined_bash_functions
install_local_bin
install_gitconfig
install_fd
install_yq
install_jq
install_nerd_font
install_fzf
install_ripgrep
install_nvim
install_gcloud
install_go
install_starship
install_gh
install_kubectl

echo ''
_logInfo "  All installed!"
