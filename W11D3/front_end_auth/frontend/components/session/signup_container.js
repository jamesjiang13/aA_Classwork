import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import SignUp from './signup';

const mapDispatchToProps = dispatch => ({
  createNewUser: formUser => dispatch(createNewUser(formUser)) 
})

export default connect(
  null,
  mapDispatchToProps
) (SignUp);

// this will give us a function createNewUser inside of our prop 