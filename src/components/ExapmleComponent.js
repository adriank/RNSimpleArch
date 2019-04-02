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
