install_obsidian()  {

  local VERSION
  local INSTALL_DIR
  local DOWNLOAD_URL
  local TMP_FILE

  # --- Configuration ---
  VERSION="1.12.7"
  INSTALL_DIR="$HOME/apps/obsidian-${VERSION}"
  DOWNLOAD_URL="https://github.com/obsidianmd/obsidian-releases/releases/download/v${VERSION}/Obsidian-${VERSION}.AppImage"

  if [ -d "$INSTALL_DIR" ]; then
    _logInfo "[obsidian]  Found existing obsidian installation at $INSTALL_DIR"
    return
  fi

  # This script downloads and installs Obsidian AppImage
  # for Linux x86-64 into the user's home directory (~/apps/obsidian-x.y.z).

  # --- Main Logic ---

  # 1. Download the obsidian AppImage
  mkdir -p "$INSTALL_DIR"
  TMP_FILE="${INSTALL_DIR}/Obsidian.AppImage"
  curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"

  # 2. Make it executable
  chmod +x "$TMP_FILE"

  # 3. Create wrapper script to handle AppImage sandbox issues
  cat <<'WRAPPER' > "${INSTALL_DIR}/obsidian"
#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")" && pwd)"
exec "$DIR/Obsidian.AppImage" --no-sandbox "$@"
WRAPPER
  chmod +x "${INSTALL_DIR}/obsidian"

  # 4. Add obsidian to the system's PATH
  #
  cat <<EOF > ~/.bashrc.d/obsidian
# obsidian
export PATH=$INSTALL_DIR:\$PATH
EOF
  _logInfo "[obsidian]  ✅ obsidian installed successfully to $INSTALL_DIR"
}
