import { connect } from 'react-redux';
import { signUp } from '../../actions/session_actions'
import SessionForm from './SessionForm';

const mapState = ( state ) => ({
  errors: state.errors.session,
  formType: "signup"
})

const mapProps = (dispatch) => ({
  processForm: (user) => dispatch(signUp(user))
})

export default connect(
  mapState, mapProps
) (SessionForm);