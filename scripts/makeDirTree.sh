#!/bin/sh
cd $1
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

cat >./src/components/Main.js <<EOL
import React, { Component } from 'react'

import {
	StyleSheet,
	View
} from 'react-native'

import connectHelper from '../connectHelper'

const Main = props => {
	const { state, actions } = props
	return (
		<Container style={{ backgroundColor: "#09b24d" }}>
			<Content>
			</Content>
		</Container>
	)
}

Main.navigationOptions = ({ navigation }) => ({
	header: <Header>
						<Body>
							<Title>MyApp</Title>
						</Body>
					</Header>
})

export default connectHelper(MainView);

const styles = StyleSheet.create({
	myStyle: {
	}
})
EOL

mkdir src/lib
mkdir src/lib/types
mkdir src/i18n
mkdir src/reducers
mkdir src/actions

cat >./src/actions/types.js <<EOL
export const EXAMPLE_TYPE = 'EXAMPLE_TYPE'
EOL

cat >./src/actions/actions.js <<EOL
import * as types from './types';

export function exampleAction(value) {
  return {
    type: types.EXAMPLE_TYPE,
		value
  }
}
EOL

cat >./src/initialState.js <<EOL
export default {}
EOL

mkdir assets
mkdir assets/fonts
mkdir assets/images

mkdir tests
cat >./tests/setup-tests.js <<EOL
'use strict';
require('babel-register');
require('babel-polyfill');

let chai = require('chai');
let chaiAsPromised = require('chai-as-promised');
let chaiImmutable = require('chai-immutable');

chai.expect;
chai.use(chaiImmutable);
chai.use(chaiAsPromised);

global.expect = chai.expect;
EOL

mkdir tools

cat >./src/rootReducer.js <<EOL
import initial_state from "./initialState.js"
import { fromJS } from 'immutable'

const INITIAL_STATE = fromJS(initial_state)
const rootReducer = function(state = INITIAL_STATE, action = {}) {
  switch (action.type) {
		case 'EXAMPLE_TYPE':
			return exampleAction(state, action.value)
	}
  return state
}

export default rootReducer
EOL

cat >./src/reducers/index.js <<EOL
import { fromJS, List, Map } from 'immutable';

export function exampleAction(state, value) {
	return state.set("value", value)
}
EOL

cat >./src/store.js <<EOL
import { createStore, applyMiddleware, combineReducers } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from './rootReducer';

const createStoreWithMiddleware = applyMiddleware(thunk)(createStore);

// const reducer = combineReducers(rootReducer);

export default function makeStore() {
  return createStoreWithMiddleware(rootReducer)
}
EOL

cat >./src/connectHelper.js <<EOL
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions/actions';

export default (view) => connect(state => ({
		state: state
	}),
	(dispatch) => ({
		actions: bindActionCreators(actions, dispatch)
	})
)(view);
EOL

moveAppJS() {
  rm App.js
  local search="import App from '\.\/App'"
  local replace="import App from '\.\/src\/App'"
  sed -i "" "s/${search}/${replace}/g" index.js
}

moveAppJS

cat >./src/App.js <<EOL
import React, { Component } from 'react';
import { Provider } from 'react-redux'
import { StackNavigator } from 'react-navigation';

import makeStore from './store'

import Main from './containers/Main'

const Navigation = StackNavigator({
	Main: { screen: Main },
})

const store = makeStore()

// !!! CHANGE THE CLASS NAME TO MATCH STRING IN index.js (registerComponent) !!!
export default class App extends Component {
  constructor() {
    super()
	}

	componentDidMount() {
	}

	render() {
		return (
			<Provider store={store}>
				<Navigation />
			</Provider>
		)
  }
}
EOL

cp -r ../scripts/.vscode .

cd ..
