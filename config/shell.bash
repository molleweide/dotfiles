#!/usr/bin/env bash

for f in "$DOROTHY/user/sources/"*.bash; do
  source "$f"
done
