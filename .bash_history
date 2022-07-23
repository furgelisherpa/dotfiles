git clone https://github.com/furgelisherpa/dotfiles
cd dotfiles/
ls -lAH
mv . ..
mv .* ..
cd
ls
ls -lAH
cd .config/
ls
cd ..
rm -rf .bash_history 
chsh -s /usr/bin/zsh 
ln -s .zprofile ~/.config/shell/profile 
ln -s ~/.config/shell/profile ~/.zprofile
ln -s ~/.config/x11/xprofile ~/.xprofile
vim .xprofile 
git clone https://github.com/furgelisherpa/suckless
cd dwm
ls
cd suckless/
cd dwm
sudo make clean install
sudo apt install build-essential libx11-dev libxft-devel libxinerama-dev libfreetype6-dev libfontconfig1-dev
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev
echo "build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev" >> ~/package
sudo make clean install
cd
ls
cat package >> program 
vim program 
ls
cd suckless/
ls
cd dwmblocks/
ls
cd ..
cd dwm
sudo make clean install
sudo apt install scb
sudo apt install xcb
sudo apt install harfbuzz
sudo apt search harfbuzz
sudo apt install lib-harfbuzz-dev
sudo apt install libharfbuzz-dev
sudo make clean install
apt search xcb
apt search xcb | less
echo "libx11-xcb-dev
sudo make clean install
echo "libx11-xcb-dev" >> ~/program 
echo "libharfbuzz-dev" >> ~/program 
apt search libxcb-res
apt install libxcb-res0
sudo apt install libxcb-res0
sudo make clean install
sudo apt install libxcb-res0-dev
echo "libxcb-res0" >> ~/program 
echo "libxcb-res0-dev" >> ~/program 
sudo apt install libxcb-res0-dev
sudo make clean install
cd ..
ls
cd slstatus/
sudo make clean install
cd ..
cd
ls
vim program 
ls
rm -rf package 
ls
zsh
vim .config/shell/profile 
startx
sudo apt install xorg-xinit
sudo apt install xinit
echo "xinit" >> ~/program 
zsh
