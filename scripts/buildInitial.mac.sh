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

if ! [ -x "$(command -v react-native)" ]; then
  npm install -g react-native-cli
fi

if ! [ -x "$(command -v yarn)" ]; then
  npm install -g yarn
fi

if ! [ -d $1 ]; then
  echo 'Creating new project.'
  react-native init $1
  sh scripts/installDeps.sh $1
  sh scripts/makeDirTree.sh $1
else
  echo '(NOT IMPLEMENTED YET) Found project, updating.'
  # NOT IMPLEMENTED YET
  #     UPDATE RNSA
  # sh scripts/installDeps.sh $1
  # sh scripts/makeDirTree.sh $1
fi

