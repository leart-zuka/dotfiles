#!/usr/bin/env bash

VENV_DIR="$HOME/.pycalc_venv"

if [ ! -d "$VENV_DIR" ]; then
  python -m venv "$VENV_DIR"
  "$VENV_DIR/bin/pip" install --upgrade pip
  "$VENV_DIR/bin/pip" install numpy pandas ipython
fi

# start ipython
"$VENV_DIR/bin/ipython"
