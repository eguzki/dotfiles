install_inputrc_config() {
	local LOCAL_DIR
	local LOCAL_FILE
	local DEST_FILE

	LOCAL_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
	LOCAL_FILE="${LOCAL_DIR}/.inputrc"
	DEST_FILE="$HOME/.inputrc"

	# Add inputrc configuration
	#
	cp -r $LOCAL_FILE $DEST_FILE

	_logInfo "[.inputrc]  ✅ .inputrc configuration installed successfully to $DEST_FILE"
}
