import {
  createStore,
  applyMiddleware,
  combineReducers
} from 'redux';
// import {combineReducers} from 'redux-immutable';
import thunk from 'redux-thunk';
import { persistStore, persistReducer, autoMergeLevel2 } from 'redux-persist'
import storage from 'redux-persist/lib/storage'
import immutableTransform from 'redux-persist-transform-immutable'

import rootReducer from '../rootReducer';

const middleware = process.env.NODE_ENV === 'development'
? [require('redux-immutable-state-invariant').default(), thunk]
: [thunk];

// combineReducers is not compatible with Immutable.JS. If you'd like to use combineReducers with Immutable.JS, install redux-immutable. If you don't use Immutable.JS, uncomment line 4 of this file and implement your reducers here.
const reducer = combineReducers({
  "store": rootReducer
});

const persistConfig = {
  key: 'root',
  storage,
  stateReconciler: autoMergeLevel2,
  transforms: [immutableTransform()],
}

const store = createStore(
  persistReducer(persistConfig, reducer),
  applyMiddleware(...middleware)
)
const persistor = persistStore(store)

export {
  store,
  persistor
}
