import { fromJS, List, Map } from 'immutable';

export function exampleAction(state, value) {
	return state.set("value", value)
}
