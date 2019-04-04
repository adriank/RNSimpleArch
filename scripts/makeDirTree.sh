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

cat >./src/containers/Main.js <<EOL
import React, { Component } from 'react'

import {
	StyleSheet,
} from 'react-native'

import {
  Container,
  Content,
  Button,
  Header,
  Body,
  Text,
  Title
} from 'native-base'

import connectHelper from '../connectHelper'

const MainView = props => {
	const { state, actions } = props
	return (
		<Container style={{ backgroundColor: "#09b24d" }}>
			<Content>
        <Text>Value: {state.get("value")}</Text>
        <Button onPress={() => actions.increment()}><Text>Increment</Text></Button>
        <Button onPress={() => actions.decrement()}><Text>Decrement</Text></Button>
			</Content>
		</Container>
	)
}

MainView.navigationOptions = ({ navigation }) => ({
	header: <Header>
						<Body>
							<Title>Main Screen</Title>
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
export const INCREMENT = 'INCREMENT'
export const DECREMENT = 'DECREMENT'
EOL

cat >./src/actions/actions.js <<EOL
import * as types from './types';

export function increment(value = 1) {
  return {
    type: types.INCREMENT,
    value
  }
}

export function decrement(value = 1) {
  return {
    type: types.DECREMENT,
    value
  }
}

EOL

cat >./src/initialState.js <<EOL
export default {
  "value": 0
}
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

import * as types from './actions/types';
import {
  increment,
  decrement
} from './reducers'

const INITIAL_STATE = fromJS(initial_state)
const rootReducer = function(state = INITIAL_STATE, action = {}) {
  switch (action.type) {
		case types.INCREMENT:
			return increment(state, action.value)
		case types.DECREMENT:
			return decrement(state, action.value)
	}
  return state
}

export default rootReducer

EOL

cat >./src/reducers/index.js <<EOL
import { fromJS, List, Map } from 'immutable';

export function increment(state, value) {
	return state.update("value", old => old + value)
}

export function decrement(state, value) {
  const newValue = state.get("value") - value
  return newValue >= 0
  ? state.set("value", newValue)
  : state.set("value", 0)
}

EOL

cat >./src/store.js <<EOL
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from './rootReducer';

const createStoreWithMiddleware = applyMiddleware(thunk)(createStore);

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
import { createStackNavigator, createAppContainer } from 'react-navigation';

import makeStore from './store'

import MainView from './containers/Main'

const Routes = createStackNavigator({
	Main: { screen: MainView },
},{
  initialRouteName: "Main"
})
const Navigation = createAppContainer(Routes);


const store = makeStore()

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
