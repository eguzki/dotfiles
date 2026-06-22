install_jira_config() {

	local config_file="$HOME/.bashrc.d/jira"

	if [[ -f "$config_file" ]]; then
		_logInfo "[jira]  ✅ Atlassian Jira config already exists at $config_file, skipping"
		return 0
	fi

	local api_token
	read -rsp "[jira] Enter Atlassian API Token: " api_token
	echo

	cat <<EOF >"$config_file"
# Atlassian JIRA
export JIRA_URL="https://redhat.atlassian.net"
export JIRA_USERNAME="eastizle@redhat.com"
export JIRA_API_TOKEN="$api_token"
EOF
	_logInfo "[jira]  ✅ Atlassian Jira config installed successfully in $config_file"
}
