#!/bin/sh
brew install node
brew install watchman
npm install -g react-native-cli
react-native init $1 --template typescript
./createFolders.sh
