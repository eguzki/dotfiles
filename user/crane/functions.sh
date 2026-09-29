install_crane() {
	# https://github.com/google/go-containerregistry/blob/main/cmd/crane/README.md

	local VERSION
	local INSTALL_DIR
	local DOWNLOAD_URL
	local TMP_DIR
	local TMP_FILE

	# --- Configuration ---
	VERSION="0.22.1"
	INSTALL_DIR="$HOME/apps/crane-${VERSION}"
	DOWNLOAD_URL="https://github.com/google/go-containerregistry/releases/download/v${VERSION}/go-containerregistry_Linux_x86_64.tar.gz"

	if [ -d "$INSTALL_DIR" ]; then
		_logInfo "[crane]  Found existing crane installation at $INSTALL_DIR"
		return
	fi

	# This script downloads and installs the release of crane
	# for Linux x86-64 into the user's home directory (~/apps/crane-x.y.z).

	# --- Main Logic ---

	# Create a temporary directory
	TMP_DIR=$(mktemp -d)
	TMP_FILE="${TMP_DIR}/go-containerregistry-linux-amd64.tar.gz"

	# 1. Download the crane release
	curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

	# 2. Extract the downloaded archive into the home directory
	mkdir -p "$INSTALL_DIR"
	tar xzvf "$TMP_FILE" -C "$INSTALL_DIR" crane

	# 3. Clean up the temporary file
	rm -rf "$TMP_DIR"

	# 4. Add crane to the system's PATH
	#
	cat <<EOF >~/.bashrc.d/crane
# crane
export PATH=$INSTALL_DIR:\$PATH
EOF
	_logInfo "[crane]  ✅ crane installed successfully to $INSTALL_DIR"
}
