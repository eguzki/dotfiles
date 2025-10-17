install_fd()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="10.3.0"
  INSTALL_DIR="$HOME/apps/fd-${VERSION}"
  DOWNLOAD_URL="https://github.com/sharkdp/fd/releases/download/v${VERSION}/fd-v${VERSION}-x86_64-unknown-linux-gnu.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing fd installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of fd
  # for Linux x86-64 into the user's home directory (~/apps/fd-x.y.z).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/fd-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add fd to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/fd
# FD
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ fd installed successfully to $INSTALL_DIR"
}
