install_jira_config() {

	# 1. Add Jira config to the system's PATH
	#
	cat <<EOF >~/.bashrc.d/jira
# Atlassian JIRA
export JIRA_URL="https://redhat.atlassian.net"
export JIRA_USERNAME="eastizle@redhat.com"
export JIRA_API_TOKEN="your-token-here"
EOF
	_logInfo "[jira]  ✅ Atlassian Jira config installed successfully in ~/.bashrc.d/jira"
}
