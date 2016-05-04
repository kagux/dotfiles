#!/bin/bash

failed_items=""
function install_package() {
echo EXECUTING: brew install $1 $2
brew install $1 $2
[ $? -ne 0 ] && $failed_items="$failed_items $1" # package failed to install.
}
brew tap caskroom/cask
brew tap neovim/neovim
install_package ansible ''
install_package autoconf ''
install_package automake ''
install_package brew-cask ''
install_package cmake ''
install_package elixir ''
install_package erlang ''
install_package gdbm ''
install_package gettext ''
install_package go ''
install_package htop-osx ''
install_package jmeter '  --with-plugins'
install_package jpeg ''
install_package libevent ''
install_package libpng ''
install_package libtiff ''
install_package libtool ''
install_package libyaml ''
install_package n ''
install_package openssl ''
install_package pcre ''
install_package pkg-config ''
install_package the_silver_searcher ''
install_package tmux ''
install_package transmission ''
install_package unixodbc ''
install_package wget ''
install_package wxmac ''
install_package xz ''
install_package zsh ''
install_package zsh-completions ''
install_package python3 ''
[ ! -z $failed_items ] && echo The following items were failed to install: && echo $failed_items
