#!/usr/bin/env bash

for f in "$DOROTHY/user/sources/"*.zsh; do
  source "$f"
done
