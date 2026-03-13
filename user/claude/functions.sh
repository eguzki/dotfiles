install_claude_plugins()  {

  local CWP
  local INSTALL_DIR

  # --- Configuration ---
  INSTALL_DIR="$HOME/.claude/plugins/local"
  CWP=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

  # --- Local Marketplace Install ---
  if [ -d "$INSTALL_DIR" ]; then
    rm -rf $INSTALL_DIR 2>/dev/null
  fi

  # In the command, we use source/. instead of source to take advantage of Bash globbing
  # and ensure we copy any hidden files or folders, which would be missed if we just used source.
  cp -a $CWP/local-marketplace/. $INSTALL_DIR
  _logInfo "  ✅ Claude local marketplace installed successfully to $INSTALL_DIR"
}
