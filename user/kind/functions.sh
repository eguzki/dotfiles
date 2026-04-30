install_kind()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_FILE

  # --- Configuration ---
  VERSION="0.31.0"
  INSTALL_DIR="$HOME/apps/kind-${VERSION}"
  DOWNLOAD_URL="https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing kind installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of kind
  # for Linux x86-64 into the user's home directory (~/apps/kind-x.y.z).

  # --- Main Logic ---

  # 1. Download the kind binary
  mkdir -p "$INSTALL_DIR"
  TMP_FILE="${INSTALL_DIR}/kind"
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Make it executable
  chmod +x "$TMP_FILE"

  # 3. Add kind to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/kind
# kind
export PATH=$INSTALL_DIR:\$PATH
source <(kind completion bash)
EOF
  _logInfo "  ✅ kind installed successfully to $INSTALL_DIR"
}
