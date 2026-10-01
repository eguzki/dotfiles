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
  _logInfo "[claude]  ✅ Claude local marketplace installed successfully to $INSTALL_DIR"

  # Registering the marketplace and enabling plugins from it is interactive
  # (claude prompts for confirmation), so it isn't run here. Surface the
  # commands so they show up in the install logs instead.
  _logInfo "[claude]  ℹ️  Run 'claude plugin marketplace add $INSTALL_DIR' to register the marketplace"
  _logInfo "[claude]  ℹ️  Run 'claude plugin install personal-skills@personal-marketplace' to enable the personal-skills plugin"
}

install_claude_settings()  {

  local CWP
  local SETTINGS_FILE
  local TEMPLATE_FILE
  local JQ_BIN
  local MERGED

  # --- Configuration ---
  CWP=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  SETTINGS_FILE="$HOME/.claude/settings.json"
  TEMPLATE_FILE="$CWP/settings.json"

  # jq may have just been installed into ~/apps by install_jq in this same
  # run, before its ~/.bashrc.d snippet has been sourced into PATH.
  JQ_BIN=$(command -v jq || ls -d "$HOME"/apps/jq-*/jq 2>/dev/null | sort -V | tail -1)
  if [ -z "$JQ_BIN" ]; then
    _logWarn "[claude]  ⚠️  jq not found, skipping Claude settings merge"
    return
  fi

  # --- Settings Merge ---
  # Merges every array under "permissions" in the template (deny, allow, ...)
  # into the user's existing settings.json, union'd and de-duplicated,
  # without touching any other keys already present (model, enabledPlugins, etc).
  mkdir -p "$HOME/.claude"
  if [ ! -f "$SETTINGS_FILE" ]; then
    echo '{}' > "$SETTINGS_FILE"
  fi

  MERGED=$("$JQ_BIN" --slurpfile tmpl "$TEMPLATE_FILE" '
    ($tmpl[0].permissions // {}) as $new
    | .permissions = (
        (.permissions // {}) as $existing
        | $new | to_entries | reduce .[] as $kv ($existing;
            .[$kv.key] = (((.[$kv.key] // []) + $kv.value) | unique)
          )
      )
  ' "$SETTINGS_FILE")

  echo "$MERGED" > "$SETTINGS_FILE"
  _logInfo "[claude]  ✅ Claude settings permissions merged into $SETTINGS_FILE"
}
