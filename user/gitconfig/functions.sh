install_gitconfig()  {

  local DEST_FILE
  local LOCAL_DIR
  local LOCAL_FILE

  # --- Configuration ---
  DEST_FILE="$HOME/.gitconfig"
  LOCAL_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  LOCAL_FILE="${LOCAL_DIR}/.gitconfig"

  if [ -f "$DEST_FILE" ]; then
    _logInfo "  Found existing .gitconfig installation"

    if cmp --silent "$DEST_FILE" "$LOCAL_FILE" ; then
      return
    fi
  fi

  cp -r $LOCAL_DIR/.gitconfig $DEST_FILE
  _logInfo "  ✅ gitconfig installed successfully"
}
