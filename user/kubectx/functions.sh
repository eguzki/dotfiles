install_kubectx() {

	local VERSION
	local INSTALL_DIR
	local DOWNLOAD_URL
	local TMP_DIR
	local TMP_FILE

	# --- Configuration ---
	VERSION="0.11.0"
	INSTALL_DIR="$HOME/apps/kubectx-${VERSION}"
	DOWNLOAD_URL="https://github.com/ahmetb/kubectx/releases/download/v${VERSION}/kubectx_v${VERSION}_linux_x86_64.tar.gz"

	if [ -d "$INSTALL_DIR" ]; then
		_logInfo "[kubectx]  Found existing kubectx installation at $INSTALL_DIR"
		return
	fi

	# This script downloads and installs the release of kubectx
	# for Linux x86-64 into the user's home directory (~/apps/kubectx-x.y.z).

	# --- Main Logic ---

	# Create a temporary directory
	TMP_DIR=$(mktemp -d)
	TMP_FILE="${TMP_DIR}/kubectx-linux-amd64.tar.gz"

	# 1. Download the kubectx release
	curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

	# 2. Extract the downloaded archive into the home directory
	mkdir -p "$INSTALL_DIR"
	tar xzvf "$TMP_FILE" -C "$INSTALL_DIR"

	# 3. Clean up the temporary file
	rm -rf "$TMP_DIR"

	# 4. Add kubectx to the system's PATH
	#
	cat <<EOF >~/.bashrc.d/kubectx
# kubectx
export PATH=$INSTALL_DIR:\$PATH
EOF
	_logInfo "[kubectx]  ✅ kubectx installed successfully to $INSTALL_DIR"
}
