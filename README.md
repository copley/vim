NOTE: When installing Vim configuration.
Create .vim file at ~ location and remove all contents if files somehow are autogenerated inside.
In dir ~/.vim create two directories named, autoload & bundle.
In dir ~/.vim/bundle clone vundle repo.
In ~/.vim/autoload clone pathogen repo.


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
Launch vim and run :PluginInstall