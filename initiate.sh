DOTFILES=$HOME/dotfiles
echo "Linking to" $DOTFILES

#ln -s $DOTFILES/bash_aliases .bash_aliases
ln -fs $DOTFILES/bash_gitprompt $HOME/.bash_gitprompt
ln -fs $DOTFILES/bash_logout $HOME/.bash_logout
ln -fs $DOTFILES/bash_profile $HOME/.bash_profile
ln -fs $DOTFILES/bashrc $HOME/.bashrc
ln -fs $DOTFILES/bashrc_private $HOME/.bash_private
ln -fs $DOTFILES/bin $HOME/bin
ln -fs $DOTFILES/ctags $HOME/.ctags
ln -fs $DOTFILES/dircolors $HOME/.dircolors
ln -fs $DOTFILES/emacs.d $HOME/.emacs.d
ln -fs $DOTFILES/fonts $HOME/.fonts
ln -fs $DOTFILES/git_completion $HOME/.git_completion
cp $DOTFILES/gitconfig $HOME/.gitconfig
ln -fs $DOTFILES/gitignore $HOME/.gitignore
ln -fs $DOTFILES/gitk $HOME/.gitk
ln -fs $DOTFILES/irssi $HOME/.irssi
ln -fs $DOTFILES/profile $HOME/.profile
ln -fs $DOTFILES/psqlrc $HOME/.psqlrc
ln -fs $DOTFILES/pythonrc $HOME/.pythonrc
ln -fs $DOTFILES/scripts $HOME/.scripts
ln -fs $DOTFILES/selected_editor $HOME/.selected_editor
ln -fs $DOTFILES/sqliterc $HOME/.sqliterc
ln -fs $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -fs $DOTFILES/vim $HOME/.vim
ln -fs $DOTFILES/vimrc $HOME/.vimrc
ln -fs $DOTFILES/Xresources $HOME/.Xresources
ln -fs $DOTFILES/bin/ssh-login $HOME/.ssh/ssh-login
ln -fs $DOTFILES/config $HOME/.config
touch $HOME/.bash_history
touch $HOME/.pythonhist
