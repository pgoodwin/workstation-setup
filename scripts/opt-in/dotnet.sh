echo
echo "Installing dotnet requirements"
brew cask install dotnet dotnet-sdk
source ${WORKSTATION_SETUP_HOME}/scripts/opt-in/dotnet-tools.sh
