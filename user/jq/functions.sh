install_jq()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL

  # --- Configuration ---
  VERSION="1.8.1"
  INSTALL_DIR="$HOME/apps/jq-${VERSION}"
  DOWNLOAD_URL="https://github.com/jqlang/jq/releases/download/jq-${VERSION}/jq-linux-amd64"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing jq installation at $INSTALL_DIR"
    return
  fi

  mkdir -p $INSTALL_DIR

  # This script downloads and installs the release of jq
  # for Linux x86-64 into the user's home directory (~/apps/jq-x.y.z).

  # --- Main Logic ---

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "${INSTALL_DIR}/jq"

  # 2. Make it executable
  chmod +x ${INSTALL_DIR}/jq

  # 3. Add JQ to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/jq
# JQ
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ jq installed successfully to $INSTALL_DIR"
}
