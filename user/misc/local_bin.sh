install_local_bin()  {
  mkdir -p ~/.local/bin

  if echo $PATH | grep --quiet "$HOME/.local/bin" ; then
    _logInfo "  ~/.local/bin already in the \$PATH"
    return
  fi

  cat <<EOF > ~/.bashrc.d/local_bin
export PATH=$HOME/.local/bin:\$PATH
EOF

  _logInfo "  ✅ ~/.local/bin added to the \$PATH"
}
