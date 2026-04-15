install_acli() {

	local INSTALL_DIR
	local DOWNLOAD_URL
	local TMP_DIR
	local TMP_FILE

	# --- Configuration ---
	# Note: acli only provides 'latest' downloads, no version pinning available
	INSTALL_DIR="$HOME/apps/acli"
	DOWNLOAD_URL="https://acli.atlassian.com/linux/latest/acli_linux_amd64/acli"

	if [ -f "$INSTALL_DIR/acli" ]; then
		local CURRENT_VERSION=$($INSTALL_DIR/acli --version 2>/dev/null | head -n1 || echo "unknown")
		_logInfo "  Found existing acli installation at $INSTALL_DIR ($CURRENT_VERSION)"
		_logInfo "  To update: delete $INSTALL_DIR and run this script again"
		return
	fi

	# This script downloads and installs the Atlassian CLI (acli)
	# for Linux x86-64 into the user's home directory (~/apps/acli).

	# --- Main Logic ---

	# Create a temporary directory
	TMP_DIR=$(mktemp -d)
	TMP_FILE="${TMP_DIR}/acli"

	# 1. Download the acli binary
	curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

	# 2. Make it executable
	chmod +x "$TMP_FILE"

	# 3. Move to installation directory
	mkdir -p "$INSTALL_DIR"
	mv "$TMP_FILE" "$INSTALL_DIR/acli"

	# 4. Clean up the temporary directory
	rm -rf "$TMP_DIR"

	# 5. Add acli to the system's PATH
	#
	cat <<EOF >~/.bashrc.d/acli
# acli (Atlassian CLI)
export PATH=$INSTALL_DIR:\$PATH
EOF
	local CURRENT_VERSION=$($INSTALL_DIR/acli --version 2>/dev/null | head -n1 || echo "unknown")
	_logInfo "  ✅ acli installed successfully to $INSTALL_DIR ($CURRENT_VERSION)"
}
