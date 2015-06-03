# https://github.com/everbot/mylinux

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
bash install.sh

cd ..
rm -r ~/.vim
rm  ~/.vim
ln -s $BASEDIR/.vim ~/.vim

# make vimproc
cd ~/.vim/bundle/vimproc.vim
make

