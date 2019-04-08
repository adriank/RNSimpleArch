import React, { Component } from 'react';
import { Provider } from 'react-redux'
import { createStackNavigator, createAppContainer } from 'react-navigation';

import store from './lib/configureStore'

import MainView from './containers/Main'

const Routes = createStackNavigator({
  Main: { screen: MainView },
}, {
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
        <Navigation />
      </Provider>
    )
  }
}
