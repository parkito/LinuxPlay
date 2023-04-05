#!/bin/bash

function logInfo() {
  echo "INFO: $(date +"%T") $1"
}

function logInfo() {
  echo "DEBUG: $(date +"%T") $1"
}

function logWarn() {
  echo "$(tput setaf 1)WARN: $1$(tput sgr0)"
}
