import { signup, login, logout } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveCurrentUser = ( currentUser ) => {
  return ({
    type: RECEIVE_CURRENT_USER,
    currentUser
  })
}

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
})

// errors = []
export const receiveErrors = (errors) => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
})

// these return actual objects, that's why we need ({ code })
export const logIn = user => dispatch => { // (thunk action creator)
  login(user)
    .then(user => dispatch(receiveCurrentUser(user)))
}

export const logOut = () => dispatch => { // (thunk action creator)
  logout()
    .then(() => dispatch(logoutCurrentUser()))
}

export const signUp = user => dispatch => { // (thunk action creator)
  signup(user)
    .then((user) => dispatch(receiveCurrentUser(user)))
}