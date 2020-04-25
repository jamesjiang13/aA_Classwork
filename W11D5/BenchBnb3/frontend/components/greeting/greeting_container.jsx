import { connect } from 'react-redux';
import { logOut } from '../../actions/session_actions'
import Greeting from './greeting';


/* mapStateToProps is used for selecting the part of the data 
from the store that the connected component needs.
It is called every time the store state changes.
It receives the entire store state, returns an object of data this component needs.

The first argument to a mapStateToProps function is the entire 
Redux store state(the same value returned by a call to store.getState())
The function should return a plain object that contains the data the component needs
*/

const mapStateToProps = (state) => ({ 
  // (state.session.id: state.entities.users[state.sesion.id])
  currentUser: state.entities.users[state.session.id] 
  // currentUser is only ref'd in pres component
})

// With React Redux, your components never access the store directly. 
// Connect does it for you. React-Redux gives you two ways to let 
// components dispatch actions:

// 1. By default, a connected component receives props.dispatch and can 
// dispatch actions itself.
// 2. Connect can accept an argument called mapDispatchToProps, which lets 
// you create functions that dispatch when called, and pass those functions as 
// props to your component.

// You will also likely want to forward arguments to your action creators:
// make actions from our components
const mapDispatchToProps = dispatch => ({
  logOut: () => dispatch(logOut())
  //^ this is in props
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
) (Greeting)