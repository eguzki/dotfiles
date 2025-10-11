install_nvim ()  {

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
    export PATH=\$PATH:$INSTALL_DIR/bin
EOF
  _logInfo "  ✅ Neovim installed successfully to $INSTALL_DIR"
}
