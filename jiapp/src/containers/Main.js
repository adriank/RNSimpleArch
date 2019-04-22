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

import connectHelper from '../lib/connectHelper'

const MainView = props => {
  const { state, actions } = props
  return (
    <Container style={styles.pageStyle}>
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
  pageStyle: {
    backgroundColor: "#09b24d"
  }
})
