import React from 'react';
import { Route, Redirect, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
              // what is this stuff below
const Auth = ({ component: Component, path, loggedIn, exact }) => (
  <Route
    path={path}
    exact={exact}
    render={props =>
      loggedIn ? <Redirect to="/" /> : <Component {...props} />
    }
  />
)

const mapState = state => ({
  state: { loggedIn: Boolean(state.session.id) }
})

export const AuthRoute = withRouter(
  connect(
    mapState, null
  )(Auth)
)