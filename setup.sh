# https://github.com/everbot/mylinux

BASEDIR=$(pwd)
git clone https://github.com/everbot/dotfiles.git
git clone https://github.com/everbot/.vim.git

cd dotfiles
bash install.sh

cd ..
rm -r ~/.vim
rm  ~/.vim
ln -s $BASEDIR/.vim ~/.vim

