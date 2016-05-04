#!/bin/bash

brew install --HEAD neovim
sudo easy_install pip
pip install --user neovim
pip3 install --user neovim

# fix ctrl-h https://github.com/neovim/neovim/issues/2048
cd $HOME \
  && infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti \
  && tic $TERM.ti
