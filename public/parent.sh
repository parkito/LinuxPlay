#!/bin/bash

function now() {
  date +"%T"
}

function logInfo() {
  echo "INFO: $(now) $1"
}

function logInfo() {
  echo "DEBUG: $(now) $1"
}

function logWarn() {
  echo "$(tput setaf 1)WARN: $(now) $1$(tput sgr0)"
}

function sourceRemote() {
local target="$1"
logInfo "Sourcing $target"
# shellcheck disable=SC1090
source <(curl --proto '=https' --tlsv1.2 -sSf "$target")
}