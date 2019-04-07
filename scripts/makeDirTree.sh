#!/bin/sh

if [ -z "$1" ]; then
  echo "Name has to be defined!";
  exit;
fi

cd $1
templatesDir='../scripts/templatesjs'
mkdir src
mkdir src/__specs__
mkdir src/components
cat >./src/components/ExapmleComponent.js <<EOL
import React, { Component } from 'react'

import {
	StyleSheet,
} from 'react-native'

const ExapmleComponent = props => {
	return <View style={styles.exampleStyle} />
}

export default ExapmleComponent

const styles = StyleSheet.create({
	exampleStyle: {
		backgroundColor: "green"
	}
}
EOL

mkdir src/containers
cat >./src/containers/ExapmleContainer.js <<EOL
import React, { Component } from 'react'
import {
	StyleSheet,
} from 'react-native'

import connectHelper from '../connectHelper'

const ExapmleContainer = props => {
	return <View style={styles.exampleStyle} />
}

export default connectHelper(ExapmleContainer)

const styles = StyleSheet.create({
	exampleStyle: {
		backgroundColor: "green"
	}
}
EOL

cp $templatesDir/Main.js ./src/containers/Main.js

mkdir src/lib
mkdir src/lib/types
mkdir src/i18n
mkdir src/reducers
mkdir src/actions

cp $templatesDir/types.js ./src/actions/types.js
cp $templatesDir/actions.js ./src/actions/actions.js
cp $templatesDir/initialState.js ./src/initialState.js

mkdir assets
mkdir assets/fonts
mkdir assets/images

mkdir tests
cp $templatesDir/setup-tests.js ./tests/setup-tests.js

mkdir scripts

cp $templatesDir/rootReducer.js ./src/rootReducer.js
cp $templatesDir/reducers_index.js ./src/reducers/index.js
cp $templatesDir/configureStore.js ./src/lib/configureStore.js
cp $templatesDir/connectHelper.js ./src/lib/connectHelper.js

moveAppJS() {
  rm App.js
  local search="import App from '\.\/App'"
  local replace="import App from '\.\/src\/App'"
  sed -i "" "s/${search}/${replace}/g" index.js
}

moveAppJS

cp $templatesDir/App.js ./src/App.js

cp -r ../scripts/.vscode .
cp ../scripts/createReducer.sh ./scripts

cd ..
