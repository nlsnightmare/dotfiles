#!/bin/bash
DIR=$(pwd)

echo ln -s $DIR/zshrc ~/.zshrc
echo ln -s $DIR/scripts ~/.scripts

for PROGRAM in $(ls config); do
  echo ln -s $DIR/config/$PROGRAM ~/.config/$PROGRAM
done
