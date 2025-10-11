install_user_defined_bash_functions ()  {
  mkdir -p ~/.bashrc.d

  if grep --quiet "# User specific aliases and functions" ~/.bashrc ; then
    _logInfo "  ~/.bashrc already reads from ~/.bashrc.d/*"
    return
  fi

  set -e

  cat <<'EOF' >>~/.bashrc
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
  if [ -f "$rc" ]; then
    . "$rc"
  fi
  done
fi
unset rc
EOF

  _logInfo "  ~/.bashrc reads from ~/.bashrc.d/*"
}
