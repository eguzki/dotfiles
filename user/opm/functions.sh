install_opm()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  VERSION="4.18.26"
  INSTALL_DIR="$HOME/apps/opm-${VERSION}"
  DOWNLOAD_URL="https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable-4.18/opm-linux-rhel9-${VERSION}.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing opm installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of opm
  # for Linux x86-64 into the user's home directory (~/apps/opm-x.y.z).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/opm-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"

  ls $TMP_FILE
  tar xzvf "$TMP_FILE"  -C "$TMP_DIR"
  mv $TMP_DIR/opm-rhel9 "$INSTALL_DIR"/opm

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add opm to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/opm
# opm
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "  ✅ opm installed successfully to $INSTALL_DIR"
}
