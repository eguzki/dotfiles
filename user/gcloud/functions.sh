install_gcloud()  {

  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  INSTALL_DIR="$HOME/apps/gcloud"
  DOWNLOAD_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing gcloud installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of gcloud
  # for Linux x86-64 into the user's home directory (~/apps/gcloud).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/gcloud-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"
  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add gcloud to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/gcloud
# GCLOUD

source $INSTALL_DIR/path.bash.inc
source $INSTALL_DIR/completion.bash
EOF
  _logInfo "  ✅ gcloud installed successfully to $INSTALL_DIR"
}
