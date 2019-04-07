import React, { Component } from 'react';
import { Provider } from 'react-redux'
import { createStackNavigator, createAppContainer } from 'react-navigation';

import { store, persistor } from './lib/configureStore'
import { PersistGate } from 'redux-persist/integration/react'

import MainView from './containers/Main'

const Routes = createStackNavigator({
	Main: { screen: MainView },
},{
  initialRouteName: "Main"
})
const Navigation = createAppContainer(Routes);

export default class App extends Component {
  constructor() {
    super()
	}

	componentDidMount() {
	}

	render() {
		return (
			<Provider store={store}>
        <PersistGate loading={null} persistor={persistor}>
  				<Navigation />
        </PersistGate>
			</Provider>
		)
  }
}
