import { createStore, applyMiddleware, combineReducers } from 'redux';
import thunk from 'redux-thunk';
import reducer from './rootReducer';

const createStoreWithMiddleware = applyMiddleware(thunk)(createStore);

// const reducer = combineReducers(reducers);

export default function makeStore() {
  return createStoreWithMiddleware(reducer)
}
