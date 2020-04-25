import { connect } from 'react-redux';
import { logIn } from '../../actions/session_actions'
import SessionForm from './SessionForm';

const mapState = ( state ) => ({
  errors: state.errors.session,
  formType: "login"
})

const mapProps = ( dispatch ) => ({
  processForm: (user) => dispatch(logIn(user))
})

export default connect(
  mapState, mapProps
) (SessionForm);