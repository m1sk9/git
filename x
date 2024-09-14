#!/bin/bash

COMMAND=$1

MDBOOK_VERSION='0.4.40'
MDBOOK_PAGETOC_VERSION='0.2.0'
MDBOOK_ALERTS_VERSION='0.5.2'

if [[ "$(uname -s)" == *"NT"* ]]; then
    echo "This script does not support Windows. Please run it on a macOS or Linux."
    exit 1
fi

case $COMMAND in
  build)
    echo "Building ..."
    mdbook build
    echo "Done!"
    ;;
  init)
    echo "Installing mdbook (and plugins) ..."

    if ! command -v rustc &> /dev/null
    then
      echo "Rust is not installed. Please install Rust and try again."
      echo "See also: https://www.rust-lang.org/tools/install"
      exit 1
    fi

    cargo install mdbook --vers $MDBOOK_VERSION
    cargo install mdbook-pagetoc --vers $MDBOOK_PAGETOC_VERSION
    cargo install mdbook-alerts --vers $MDBOOK_ALERTS_VERSION
    echo "Done!"
    ;;
  dev)
    echo "Running ..."
    mdbook serve
    ;;
  clean)
    echo "Cleaning ..."
    mdbook clean
    echo "Done!"
    ;;
  *)
    echo "Usage: x {build|init|dev|clean}"
    ;;
esac
