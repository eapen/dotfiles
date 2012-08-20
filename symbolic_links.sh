DOTFILES=~/dotfiles
echo "Linking to" $DOTFILES

ln -s $DOTFILES/bash_aliases .bash_aliases
ln -s $DOTFILES/bash_gitprompt .bash_gitprompt
ln -s $DOTFILES/bash_logout .bash_logout
ln -s $DOTFILES/bash_profile .bash_profile
ln -s $DOTFILES/bashrc .bashrc
ln -s $DOTFILES/bashrc_private .bash_private
ln -s $DOTFILES/bin bin
ln -s $DOTFILES/ctags .ctags
ln -s $DOTFILES/dircolors .dircolors
ln -s $DOTFILES/emacs.d .emacs.d
ln -s $DOTFILES/.fonts .fonts
ln -s $DOTFILES/git_completion .git_completion
ln -s $DOTFILES/gitconfig .gitconfig
ln -s $DOTFILES/gitignore .gitignore
ln -s $DOTFILES/gitk .gitk
ln -s $DOTFILES/irssi .irssi
ln -s $DOTFILES/profile .profile
ln -s $DOTFILES/psqlrc .psqlrc
ln -s $DOTFILES/pythonrc .pythonrc
ln -s $DOTFILES/scripts .scripts
ln -s $DOTFILES/selected_editor .selected_editor
ln -s $DOTFILES/tmux.conf .tmux.conf
ln -s $DOTFILES/vim .vim
ln -s $DOTFILES/vimrc .vimrc
ln -s $DOTFILES/Xresources .Xresources
