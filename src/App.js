import React, { Component } from 'react';
import { Provider } from 'react-redux'
import { StackNavigator } from 'react-navigation';

import makeStore from './src/store'

import Main from './src/containers/Main'

const Navigation = StackNavigator({
	Main: { screen: Main },
})

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
