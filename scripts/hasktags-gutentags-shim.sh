#!/bin/bash

set -euo pipefail

append=0
while [[ "$#" -gt 0 ]]; do case $1 in
  -f|--file)    tagsfile="$2"; shift;;
  --options=*)  options="${1#*=}"   ;;
  -a|--append)  append=1            ;;
  *)            path="$1"           ;;
esac; shift; done

touch "$tagsfile"

hasktags -R -c --file - "$path" |\
  LC_ALL=C sort -m "$tagsfile" - -o "$tagsfile"
