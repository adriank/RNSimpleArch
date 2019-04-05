#!/bin/sh
cd $1
yarn add redux # no brainer
yarn add react-redux # no brainer
yarn add native-base # simplifies certain things, no alternative really
yarn add react-navigation # no alternative
yarn add react-native-gesture-handler # required by react-navigation
react-native link react-native-gesture-handler

# side effect handling. We don't use rx.js ATM due to long learning curve.
yarn add redux-thunk # may be redux-sagas
yarn add immutable # must have

yarn add react-native-iphone-x-helper # no other way to detect and handle iPhone X and newer specific behavior
yarn add react-native-splash-screen # splash screen is an requirement of nearly all apps so lets add it here
react-native link react-native-splash-screen

# testing
yarn add --dev mocha # now we have both, jest and mocha
yarn add --dev chai
yarn add --dev chai-as-promised
yarn add --dev chai-immutable
yarn add --dev redux-immutable-state-invariant # test for mutations in Redux store

node ../scripts/addRNPM.js
node ../scripts/addCommands.js

cd ..
