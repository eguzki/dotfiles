install_opensc_firefox_config() {
	local LOCAL_DIR
	local LOCAL_FILE
	local DEST_DIR
	local DEST_FILE

	LOCAL_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
	LOCAL_FILE="${LOCAL_DIR}/opensc.module"
	DEST_DIR="$HOME/.config/pkcs11/modules"
	DEST_FILE="${DEST_DIR}/opensc.module"

	# Stop the p11-kit proxy from exposing OpenSC to Firefox (that path mishandles
	# the YubiKey PIV touch-wait and causes a PIN/touch loop for slot 9A client-auth
	# certs). Firefox must load /usr/lib64/opensc-pkcs11.so directly as a Security
	# Device instead.
	mkdir -p "$DEST_DIR"
	cp "$LOCAL_FILE" "$DEST_FILE"
	chmod 644 "$DEST_FILE"

	_logInfo "[opensc.module]  ✅ p11-kit Firefox override installed to $DEST_FILE (load /usr/lib64/opensc-pkcs11.so directly in Firefox)"
}
