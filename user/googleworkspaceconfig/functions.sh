install_google_workspace_config() {

	local config_file="$HOME/.bashrc.d/google-workspace"

	if [[ -f "$config_file" ]]; then
		_logInfo "[google-workspace]  ✅ Google Workspace config already exists at $config_file, skipping"
		return 0
	fi

	local client_id
	read -rp "[google-workspace] Enter Google Workspace OAuth2.0 Client ID: " client_id

	local client_secret
	read -rsp "[google-workspace] Enter Google Workspace OAuth2.0 Client Secret: " client_secret
	echo

	cat <<EOF >"$config_file"
# Google Workspace
export GOOGLE_OAUTH_CLIENT_ID="$client_id"
export GOOGLE_OAUTH_CLIENT_SECRET="$client_secret"
EOF
	_logInfo "[google-workspace]  ✅ Google Workspace config installed successfully in $config_file"
}
