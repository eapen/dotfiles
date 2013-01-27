DOTFILES=~/dotfiles
echo "Linking to" $DOTFILES

#ln -s $DOTFILES/bash_aliases .bash_aliases
ln -fs $DOTFILES/bash_gitprompt .bash_gitprompt
ln -fs $DOTFILES/bash_logout .bash_logout
ln -fs $DOTFILES/bash_profile .bash_profile
ln -fs $DOTFILES/bashrc .bashrc
ln -fs $DOTFILES/bashrc_private .bash_private
ln -fs $DOTFILES/bin bin
ln -fs $DOTFILES/ctags .ctags
ln -fs $DOTFILES/dircolors .dircolors
ln -fs $DOTFILES/emacs.d .emacs.d
ln -fs $DOTFILES/fonts .fonts
ln -fs $DOTFILES/git_completion .git_completion
cp $DOTFILES/gitconfig .gitconfig
ln -fs $DOTFILES/gitignore .gitignore
ln -fs $DOTFILES/gitk .gitk
ln -fs $DOTFILES/irssi .irssi
ln -fs $DOTFILES/profile .profile
ln -fs $DOTFILES/psqlrc .psqlrc
ln -fs $DOTFILES/pythonrc .pythonrc
ln -fs $DOTFILES/scripts .scripts
ln -fs $DOTFILES/selected_editor .selected_editor
ln -fs $DOTFILES/sqliterc .sqliterc
ln -fs $DOTFILES/tmux.conf .tmux.conf
ln -fs $DOTFILES/vim .vim
ln -fs $DOTFILES/vimrc .vimrc
ln -fs $DOTFILES/Xresources .Xresources
