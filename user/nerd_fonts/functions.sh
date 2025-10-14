install_nerd_font ()  {
  if fc-list | grep --quiet "FiraCode"; then
    _logInfo "  FiraCode Nerd Font already installed!"
    return
  fi

  local FONT_URL
  local FONT_DIR
  local TMP_DIR

  set -e

  FONT_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
  FONT_DIR=~/.local/share/fonts
  mkdir -p ${FONT_DIR}

  # Create a temporary directory
  TEMP_DIR=$(mktemp -d)

  wget -O "$TEMP_DIR/font.zip" "$FONT_URL"

  # Unzip the font file
  unzip "$TEMP_DIR/font.zip" -d "$TEMP_DIR"

  # Move the font files to the system fonts directory
  mv "$TEMP_DIR"/*.ttf ${FONT_DIR}

  # Update the font cache
  fc-cache -f -v

  # Clean up
  rm -rf "$TEMP_DIR"

  _logInfo "  FiraCode Nerd Font installed!"
}
