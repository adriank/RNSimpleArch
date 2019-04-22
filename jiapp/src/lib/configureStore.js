import {
  createStore,
  applyMiddleware,
} from 'redux';
// import {combineReducers} from 'redux-immutable';
import thunk from 'redux-thunk';

import rootReducer from '../rootReducer';

const middleware = process.env.NODE_ENV === 'development'
  ? [require('redux-immutable-state-invariant').default(), thunk]
  : [thunk];

// combineReducers is not compatible with Immutable.JS. If you'd like to use combineReducers with Immutable.JS, install redux-immutable. If you don't use Immutable.JS, uncomment line 4 of this file and implement your reducers here.
// const reducer = combineReducers(rootReducer);

export default createStore(
  rootReducer,
  applyMiddleware(...middleware)
);
