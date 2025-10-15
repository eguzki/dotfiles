install_yq()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="4.48.1"
  INSTALL_DIR="$HOME/apps/yq-${VERSION}"
  DOWNLOAD_URL="https://github.com/mikefarah/yq/releases/download/v${VERSION}/yq_linux_amd64.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing yq installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of yq
  # for Linux x86-64 into the user's home directory (~/apps/yq-x.y.z).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/yq-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR"
  ln -s $INSTALL_DIR/yq_linux_amd64 $INSTALL_DIR/yq

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add YQ to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/yq
# YQ
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ yq installed successfully to $INSTALL_DIR"
}
