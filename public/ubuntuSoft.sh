#!/bin/bash

# shellcheck disable=SC1090
source <(curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/parkito/LinuxPlay/master/public/parent.sh)

function updateApt() {
  sudo apt-get update -y
}

function upgradeAllPackages() {
  logInfo "Update installed software"
  updateApt
  sudo apt-get upgrade -y
  sudo apt autoremove -y
}

function setupEnvConfigs() {
  logInfo "System wide configuration"
  echo EDITOR=vim >>/etc/environment
}

function magicKeyboard() {
  log "System wide configuration"
  echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
  sudo update-initramfs -u -k all
}

function doReboot() {
  sudo reboot
}