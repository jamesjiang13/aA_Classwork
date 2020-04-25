import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import Root from './components/root';
import { logIn, logOut, signUp } from './actions/session_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  // debugger

  // testing
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.signUp = signUp;
  window.logOut = logOut;
  window.logIn = logIn;

  // end testing

  ReactDOM.render(<Root store={ store } />, root);
});

// let user = {user: {username: 'jamez', password: "123456"}}
// let user = {username: 'jamez', password: "123456"}