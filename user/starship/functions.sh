install_starship()  {
  # https://starship.rs/

  local INSTALL_DIR

  # --- Configuration ---
  INSTALL_DIR="$HOME/apps/starship"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing starship installation at $INSTALL_DIR"
    return
  fi

  mkdir -p "$INSTALL_DIR"

  # This script downloads and installs the release of starship
  # for Linux x86-64 into the user's home directory (~/apps/starship).

  # --- Main Logic ---

  # 1. Install latest version
  # if starship is already installed it will be updated to the latest version
  curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir ${INSTALL_DIR}

  # 2. Add starship to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/starship
# starship
export PATH=$INSTALL_DIR:\$PATH
eval "\$(starship init bash)"
EOF
  _logInfo "  ✅ starship installed successfully to $INSTALL_DIR"
}
