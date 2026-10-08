install_aliases() {

  if [ -f ~/.bashrc.d/aliases ]; then
    _logInfo "[aliases]  ~/.bashrc.d/aliases already exists"
    return
  fi

  cat <<'EOF' > ~/.bashrc.d/aliases
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
EOF

  _logInfo "[aliases]  ✅ shell aliases written to ~/.bashrc.d/aliases"
}
