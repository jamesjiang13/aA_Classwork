import React from 'react';
// import { Route } from 'react-router-dom';
import GreetingContainer from './greeting/greeting_container';
import SignupFormContainer from './session_form/SignupFormContainer'
import LoginFormContainer from './session_form/LoginFormContainer';
import { AuthRoute } from '../util/route_util';

const App = () => (
  <div>
    <header>
      <h1> Bench me pls </h1>
      <GreetingContainer />
    </header>

    <AuthRoute path="/login" component={LoginFormContainer} />
    <AuthRoute path="/signup" component={SignupFormContainer} />
  </div>
)

export default App;