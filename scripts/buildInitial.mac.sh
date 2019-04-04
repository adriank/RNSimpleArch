#!/bin/sh

if [ -z "$1" ]; then
  echo "Name has to be defined!";
  exit;
fi

# brew install node
# brew install watchman
# npm install -g react-native-cli
react-native init $1
sh scripts/installDeps.sh $1
sh scripts/makeDirTree.sh $1
