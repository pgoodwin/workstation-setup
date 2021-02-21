echo
echo "Installing Python tools"

# guard against pre-installed pycharm
brew cask install pycharm --force

source ${WORKSTATION_SETUP_HOME}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=pycharm
popd
