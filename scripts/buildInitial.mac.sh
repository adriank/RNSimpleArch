#!/bin/sh

if [ -z "$1" ]; then
  echo "Name has to be defined!";
  exit;
fi

if ! [ -x "$(command -v node)" ]; then
  brew install node
fi

if ! [ -x "$(command -v watchman)" ]; then
  brew install watchman
fi

if ! [ -x "$(command -v react-native-cli)" ]; then
  npm install -g react-native-cli
fi

if ! [ -x "$(command -v yarn)" ]; then
  npm install -g yarn
fi

if [ -f $1 ]; then
  react-native init $1
  sh scripts/installDeps.sh $1
  sh scripts/makeDirTree.sh $1
else
  # NOT IMPLEMENTED YET
  #     UPDATE RNSA
  sh scripts/installDeps.sh $1
  sh scripts/makeDirTree.sh $1
fi

