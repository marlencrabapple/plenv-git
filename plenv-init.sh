#!/usr/bin/env bash
[[ ${PLENV_DEBUG:-0} -ne 0 ]] && set -x

if [[ -z "${PLENV_DIR:-}" ]]; then
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
  cp -vaf /usr/share/plenv/shims "$PLENV_DIR/shims"
fi

[[ -n "${PATH//*$PLENV_DIR*/}" ]] &&
  export PATH="$HOME/.plenv/shims:$HOME/.plenv/bin:$PATH" &&
  eval "$(plenv init -)"

[[ ${PLENV_DEBUG:-0} -ne 0 ]] && set +x
