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
