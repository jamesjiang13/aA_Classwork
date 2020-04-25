import { RECEIVE_CURRENT_USER } from '../actions/session_actions'; 

const defaultUser = {};

const usersReducer = (state = defaultUser, action) => {
  Object.freeze(state);
  // console.log("users reducer");
  switch (action.type) {
    case RECEIVE_CURRENT_USER: // ref action creators for action.currentUser 
      return Object.assign({}, state, { [action.currentUser.id]: action.currentUser } )
    default:
      return state
  }
}

export default usersReducer;
