# https://github.com/everbot/mylinux
# TODO: convert to Ruby

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
    git clone https://github.com/everbot/dotfiles.git
    git clone https://github.com/everbot/.vim.git
fi


cd dotfiles
./install.rb all=overwrite

# TODO: ask user before removing and symlink this
cd ..
rm -r ~/.vim
rm  ~/.vim
ln -s $BASEDIR/.vim ~/.vim

# symlink vimrc -> nvimrc
ln -s ~/.nvimrc ~/.vimrc

# make vimproc
cd ~/.vim/bundle/vimproc.vim
make

