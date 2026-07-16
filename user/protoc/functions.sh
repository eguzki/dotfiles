install_protoc()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="35.1"
  INSTALL_DIR="$HOME/apps/protoc-${VERSION}"
  DOWNLOAD_URL="https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/protoc-${VERSION}-linux-x86_64.zip"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "[protoc]  Found existing protoc installation at $INSTALL_DIR"
    return
  fi

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/protoc-linux-x86_64.zip"

  # 1. Download the protoc release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the install directory
  mkdir -p "$INSTALL_DIR"
  unzip "$TMP_FILE" -d "$INSTALL_DIR"

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add protoc to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/protoc
# PROTOC
export PATH=$INSTALL_DIR/bin:\$PATH
EOF
  _logInfo "[protoc]  ✅ protoc installed successfully to $INSTALL_DIR"
}
