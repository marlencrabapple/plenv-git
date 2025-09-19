#!/usr/bin/env bash
[[ ${PLENV_DEBUG:-0} -ne 0 ]] && set -x

if [ -z "${PLENV_DIR:-}" ]; then
  PLENV_DIR="$HOME/.plenv"
fi

export PLENV_DIR
export PLENV_ROOT="$PLENV_DIR"

if [[ ! -d "$PLENV_DIR" ]]; then
  mkdir "$PLENV_DIR"

  for dir in /usr/share/plenv/{ext,plugins,libexec}; do
    ln -s "$dir" "$PLENV_DIR/$(basename "$dir")"
  done

  ln -s "/usr/share/plenv/libexec" "$PLENV_DIR/bin"
fi

export PLENV_INIT="plenv init -${PLENV_SHELL:+ $PLENV_SHELL}"

[[ -n "${PATH//*$PLENV_DIR*/}" ]] &&
  export PATH="$HOME/.plenv/bin:$PATH" &&
  eval "$($PLENV_INIT)"
  
[[ ${PLENV_DEBUG:-0} -ne 0 ]] && set +x
