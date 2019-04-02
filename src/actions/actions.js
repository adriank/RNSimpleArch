import * as types from './types';

export function exampleAction(value) {
  return {
    type: types.EXAMPLE_TYPE,
		value
  }
}
