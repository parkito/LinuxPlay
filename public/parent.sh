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
