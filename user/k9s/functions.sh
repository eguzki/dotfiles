install_k9s()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="0.50.16"
  INSTALL_DIR="$HOME/apps/k9s-${VERSION}"
  DOWNLOAD_URL="https://github.com/derailed/k9s/releases/download/v${VERSION}/k9s_Linux_amd64.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing k9s installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of k9s
  # for Linux x86-64 into the user's home directory (~/apps/k9s-x.y.z).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/k9s-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR"

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add k9s to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/k9s
# k9s
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ k9s installed successfully to $INSTALL_DIR"
}
