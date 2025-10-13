install_fzf ()  {

  # --- Configuration ---
  VERSION="0.65.2"
  INSTALL_DIR="$HOME/apps/fzf-${VERSION}"
  DOWNLOAD_URL="https://github.com/junegunn/fzf/releases/download/v${VERSION}/fzf-${VERSION}-linux_amd64.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing fzf installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of fzf
  # for Linux x86-64 into the user's home directory (~/apps/fzf-x.y.z).

  # Exit immediately if a command exits with a non-zero status.
  set -e

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/fzf-linux64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR"

  ls -al "$INSTALL_DIR"

  # 3. Clean up the temporary file
  rm "$TMP_FILE"

  # 4. Add Neovim to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/fzf
# FZF
# Set up fzf key bindings and fuzzy completion
export PATH=\$PATH:$INSTALL_DIR
eval "\$(fzf --bash)"
EOF
  _logInfo "  ✅ fzf installed successfully to $INSTALL_DIR"
}
