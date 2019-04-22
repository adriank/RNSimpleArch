import * as types from './types';

export function increment(value = 1) {
  return {
    type: types.INCREMENT,
    value
  }
}

export function decrement(value = 1) {
  return {
    type: types.DECREMENT,
    value
  }
}
