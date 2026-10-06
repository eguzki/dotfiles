install_node() {
	# https://nodejs.org/en/download

	local VERSION
	local INSTALL_DIR
	local DOWNLOAD_URL
	local TMP_DIR
	local TMP_FILE

	# --- Configuration ---
	VERSION="22.23.3"
	INSTALL_DIR="$HOME/apps/node-${VERSION}"
	DOWNLOAD_URL="https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.xz"

	if [ -d "$INSTALL_DIR" ]; then
		_logInfo "[node]  Found existing node installation at $INSTALL_DIR"
		return
	fi

	# This script downloads and installs the release of node
	# for Linux x86-64 into the user's home directory (~/apps/node-x.y.z).

	# --- Main Logic ---

	# Create a temporary directory
	TMP_DIR=$(mktemp -d)
	TMP_FILE="${TMP_DIR}/node-linux-x64.tar.xz"

	# 1. Download the node release
	curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

	# 2. Extract the downloaded archive into the home directory
	mkdir -p "$INSTALL_DIR"
	tar xJvf "$TMP_FILE" -C "$INSTALL_DIR" --strip-components=1

	# 3. Clean up the temporary file
	rm -rf "$TMP_DIR"

	# 4. Add node to the system's PATH
	#
	cat <<EOF >~/.bashrc.d/node
# Node
export PATH=$INSTALL_DIR/bin:\$PATH
EOF
	_logInfo "[node]  ✅ node installed successfully to $INSTALL_DIR"
}
