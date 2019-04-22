import { fromJS, List, Map } from 'immutable';

export function increment(state, value) {
	return state.update("value", old => old + value)
}

export function decrement(state, value) {
  const newValue = state.get("value") - value
  return newValue >= 0
  ? state.set("value", newValue)
  : state.set("value", 0)
}
