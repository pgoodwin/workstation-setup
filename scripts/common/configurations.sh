echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring ShiftIt"
open /Applications/ShiftIt.app

echo "Configuring FlyCut"
open /Applications/Flycut.app

echo
echo "Installing vim configuration"
#pushd ~/
#if [ ! -d ~/.vim ]; then
#  curl vimfiles.luan.sh/install | FORCE=1 bash
#  bash vim-update
#fi
#popd
curl vimfiles.luan.sh/install | bash
bash vim-update
