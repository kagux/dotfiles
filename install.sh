#!/bin/bash
VIM_PLUGINS_PATH="$HOME/.vim/bundle"
YOU_COMPLETE_ME_PATH="$VIM_PLUGINS_PATH/YouCompleteMe"

# update submodules, specifically Vundle
git submodule update --init --recursive

# install vim plugins when there are none
vim_plugins_count=$(find $VIM_PLUGINS_PATH/* -maxdepth 0 -type d | wc -l)
if [[ $vim_plugins_count -eq 1 ]]; then
  echo "installing vim plugins"
  vim +PluginInstall +qall 
fi

# run install.sh of YouCompleteMe if it wasn't run before and Plugin is present
if [ -d "$YOU_COMPLETE_ME_PATH" ] && [ ! -f "$YOU_COMPLETE_ME_PATH/third_party/ycmd/ycm_client_support.so" ]; then
  echo 'youcomplete me found but not setup'
  python "$YOU_COMPLETE_ME_PATH/install.py"
fi
