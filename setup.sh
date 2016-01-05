# https://github.com/everbot/mylinux
# TODO:
# - convert to Ruby
# - handle when `dotfiles` and `~/.vim` already exist


BASEDIR=$(pwd)

if [ $# -gt 0 ]; then
    option=$1
    case $option in
        --ssh)
            echo "use ssh"
            git clone git@github.com:everbot/dotfiles.git
            git clone git@github.com:everbot/.vim.git
            shift
            ;;
        *)
            echo "Option doesn't exist! Bye!"
            exit 1
            ;;
    esac
else
    echo "use http"
    git clone https://github.com/tungel/dotfiles.git
    git clone https://github.com/tungel/.vim.git
fi


cd dotfiles
./install.rb overwrite

# TODO: ask user before removing and symlink this
cd ..
rm -rf ~/.vim
rm  ~/.vim
ln -s $BASEDIR/.vim ~/.vim

# For neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
rm -rf $XDG_CONFIG_HOME/nvim
rm $XDG_CONFIG_HOME/nvim
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
rm -rf $XDG_CONFIG_HOME/nvim/init.vim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# make vimproc
cd ~/.vim/bundle/vimproc.vim
make

