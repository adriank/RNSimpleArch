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
