install_nvim_binary ()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION=v0.11.4
  INSTALL_DIR="$HOME/apps/nvim-${VERSION}"
  DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing nvim installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of Neovim
  # for Linux x86-64 into the user's home directory (~/apps/nvim-x.y.z).

  # Exit immediately if a command exits with a non-zero status.
  set -e

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/nvim-linux64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components 1

  # 3. Clean up the temporary file
  rm "$TMP_FILE"

  # 4. Add Neovim to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/nvim
    export PATH=$INSTALL_DIR/bin:\$PATH
EOF
  _logInfo "  ✅ Neovim installed successfully to $INSTALL_DIR"
}

DOTFILES_NVIM_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

install_nvim_config () {
  mkdir -p $HOME_CONFIG

  declare -a nvim_configs=("nvim-go" "nvim-rust")

  for nvim_config in "${nvim_configs[@]}"
  do
    if [ -d "$HOME_CONFIG/${nvim_config}" ]; then
      rm -rf $HOME_CONFIG/${nvim_config} 2>/dev/null
    fi
    cp -r $DOTFILES_NVIM_PATH/config/${nvim_config} $HOME_CONFIG
    _logInfo "  ✅ Neovim ${nvim_config} config installed successfully to $HOME_CONFIG"
  done
}

install_nvim_selector ()  {
  cp $DOTFILES_NVIM_PATH/nvims $HOME/.local/bin
  _logInfo "  ✅ Neovim selector installed in $HOME/.local/bin"
}

install_nvim ()  {
    install_nvim_binary
    install_nvim_selector
    install_nvim_config
}
