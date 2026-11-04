DOTFILES_SYNOLOGY_DRIVE_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

SYNOLOGY_DRIVE_APP_ID="com.synology.SynologyDrive"

install_synology_drive_flatpak() {
	if ! command -v flatpak >/dev/null 2>&1; then
		_logWarn "[synology-drive]  flatpak not found; skipping Synology Drive install"
		return 0
	fi

	# Ensure the flathub remote exists (user scope, no root required)
	flatpak remote-add --if-not-exists --user \
		flathub https://flathub.org/repo/flathub.flatpakrepo

	if flatpak list --app --columns=application 2>/dev/null | grep -qx "$SYNOLOGY_DRIVE_APP_ID"; then
		_logInfo "[synology-drive]  ✅ $SYNOLOGY_DRIVE_APP_ID already installed, skipping"
		return 0
	fi

	_logInfo "[synology-drive]  Installing $SYNOLOGY_DRIVE_APP_ID from flathub"
	flatpak install -y --user flathub "$SYNOLOGY_DRIVE_APP_ID"
	_logInfo "[synology-drive]  ✅ $SYNOLOGY_DRIVE_APP_ID installed successfully"
}

install_synology_drive_autostart() {
	# The app's own "launch on startup" option writes its autostart entry inside
	# the Flatpak sandbox (~/.var/app/.../config/autostart/), a path the host
	# login session never reads. Install a host-level entry instead so the client
	# actually starts at login.
	local autostart_dir="$HOME_CONFIG/autostart"
	local desktop_file="$SYNOLOGY_DRIVE_APP_ID.desktop"

	if [[ -f "$autostart_dir/$desktop_file" ]]; then
		_logInfo "[synology-drive]  ✅ Autostart entry already exists at $autostart_dir/$desktop_file, skipping"
		return 0
	fi

	mkdir -p "$autostart_dir"
	cp "$DOTFILES_SYNOLOGY_DRIVE_PATH/$desktop_file" "$autostart_dir/$desktop_file"
	_logInfo "[synology-drive]  ✅ Autostart entry installed to $autostart_dir/$desktop_file"
}

install_synology_drive() {
	install_synology_drive_flatpak
	install_synology_drive_autostart
}
