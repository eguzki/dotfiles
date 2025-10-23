install_kubectl()  {

  local MINOR_VERSION
  local PATCH_VERSION
  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_DIR
  local TMP_FILE

  # --- Configuration ---
  MINOR_VERSION="4.19"
  PATCH_VERSION="16"
  VERSION="${MINOR_VERSION}.${PATCH_VERSION}"
  INSTALL_DIR="$HOME/apps/kubectl-${VERSION}"
  DOWNLOAD_URL="https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-${MINOR_VERSION}/openshift-client-linux-arm64-${VERSION}.tar.gz"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "  Found existing kubectl & oc installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs the release of kubectl
  # for Linux x86-64 into the user's home directory (~/apps/kubectl-x.y.z).

  # --- Main Logic ---

  # Create a temporary directory
  TMP_DIR=$(mktemp -d)
  TMP_FILE="${TMP_DIR}/kubectl-linux-amd64.tar.gz"

  # 1. Download the Neovim release
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Extract the downloaded archive into the home directory
  mkdir -p "$INSTALL_DIR"

  tar xzvf "$TMP_FILE" -C "$INSTALL_DIR"

  # 3. Clean up the temporary file
  rm -rf "$TMP_DIR"

  # 4. Add kubectl to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/kubectl
# kubectl
export PATH=$INSTALL_DIR:\$PATH
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
EOF
  _logInfo "  ✅ kubectl & oc installed successfully to $INSTALL_DIR"
}
