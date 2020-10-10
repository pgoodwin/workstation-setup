#!/usr/bin/env bash

echo
echo "Installing utilities for unix development"

# For users of unixes
brew install pstree
brew install the_silver_searcher
brew install wget
brew install fzf
yes | $(brew --prefix)/opt/fzf/install

# For developers of shell scripts
brew install jq

brew install lastpass-cli
