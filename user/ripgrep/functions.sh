install_ripgrep()  {

  # --- Configuration ---
  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  VERSION="14.1.1"
  INSTALL_DIR="$HOME/apps/ripgrep-${VERSION}"
  DOWNLOAD_URL="https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/ripgrep-${VERSION}-x86_64-unknown-linux-musl.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing ripgrep installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of ripgrep
  # for Linux x86-64 into the user's home directory (~/apps/ripgrep-x.y.z).

  # Exit immediately if a command exits with a non-zero status.
  set -e

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/ripgrep-linux64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

  # 3. Clean up the temporary file
  rm "$TMP_FILE"

  # 4. Add ripgrep to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/ripgrep
# ripgrep
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ ripgrep installed successfully to $INSTALL_DIR"
}
