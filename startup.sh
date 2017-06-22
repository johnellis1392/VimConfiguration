#!/bin/bash

# Setup directories for pathogen
if [ ! -f $HOME/.vim/autoload ]; then mkdir -p $HOME/.vim/autoload; fi
if [ ! -f $HOME/.vim/bundle ]; then mkdir -p $HOME/.vim/bundle; fi

# Install pathogen
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

# Initialize all submodules for vim plugins
pushd $HOME/.vim;
git submodule init --recursive;
git submodule update --recursive;
popd;
