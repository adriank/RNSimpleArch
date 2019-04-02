import initial_state from "./initialState.js"
import { fromJS } from 'immutable'

const INITIAL_STATE = fromJS(initial_state)
const rootReducer = function(state = INITIAL_STATE, action = {}) {
  switch (action.type) {
		case 'EXAMPLE_TYPE':
			return exampleAction(state, action.value)
	}
  return state
}

export default rootReducer
