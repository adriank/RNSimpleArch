import initial_state from "./initialState.js"
import { fromJS } from 'immutable'

import * as types from './actions/types';
import {
  increment,
  decrement
} from './reducers'

const INITIAL_STATE = fromJS(initial_state)
const rootReducer = function(state = INITIAL_STATE, action = {}) {
  switch (action.type) {
		case types.INCREMENT:
			return increment(state, action.value)
		case types.DECREMENT:
			return decrement(state, action.value)
	}
  return state
}

export default rootReducer
