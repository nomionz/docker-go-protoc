#!/bin/bash -e

while [[ $# -gt 0 ]]; do
  case "$1" in
    --platform=*)
      platform="${1#*=}"
      ;;
    *)
      echo "Invalid option: $1"
      exit 1
      ;;
  esac
  shift
done

platform="${platform:-x86_64}"

echo "platform: ${platform}"
