alias la='ls -la'
alias vi='vim'
alias n='nvim'
alias y='yazi'
alias z='zellij'
alias g='git'
alias lg='lazygit'
alias lj='lazyjj'
alias sc='scala-cli'
alias p='podman'
alias pc='podman-compose'
alias oc='opencode'
alias c='chezmoi'
alias h='herdr'
alias t='task -g'
alias trail='
  mkdir -p traildepot && \
  podman run \
      -p 4000:4000 \
      -e ADDRESS=0.0.0.0:4000 \
      --mount type=bind,source="$PWD"/traildepot,target=/app/traildepot \
      trailbase/trailbase /app/trail'
