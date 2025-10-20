install_gh()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="2.82.0"
  INSTALL_DIR="$HOME/apps/gh-${VERSION}"
  DOWNLOAD_URL="https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing gh installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of gh
  # for Linux x86-64 into the user's home directory (~/apps/gh-x.y.z).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/gh-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add gh to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/gh
# gh
export PATH=$INSTALL_DIR/bin:\$PATH
EOF
  _logInfo "  ✅ gh installed successfully to $INSTALL_DIR"
}
