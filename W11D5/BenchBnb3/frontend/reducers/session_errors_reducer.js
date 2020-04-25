import { RECEIVE_SESSION_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions';

const defaultErrors = [];

export const sessionErrorsReducer = ( errors = defaultErrors, action) => {
  Object.freeze(errors);

  switch (action.type) {
    case RECEIVE_SESSION_ERRORS:
      return Object.assign([], state, action.errors)
    case RECEIVE_CURRENT_USER:
      return Object.assign([])
    default:
      return errors;
  }
}

// fyi no idea if this works
// because no idea how to test