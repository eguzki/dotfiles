install_tree-sitter-cli()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="0.26.7"
  INSTALL_DIR="$HOME/apps/tree-sitter-cli-v${VERSION}"
  DOWNLOAD_URL="https://github.com/tree-sitter/tree-sitter/releases/download/v${VERSION}/tree-sitter-cli-linux-x64.zip"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing tree-sitter-cli installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of tree-sitter-cli

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/tree-sitter-cli-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  unzip "$TMP_FILE" -d "$INSTALL_DIR"
  chmod +x $INSTALL_DIR/tree-sitter

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add tree-sitter-cli to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/tree-sitter-cli
# tree-sitter-cli 
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ tree-sitter-cli installed successfully to $INSTALL_DIR"
}
