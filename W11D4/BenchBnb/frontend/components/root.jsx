import React from 'react';
import { HashRouter } from 'react-router-dom'; // wtf is hashrouter
import { Provider } from 'react-redux';
import App from './App';

const Root = ({ store }) => (
  <Provider store={ store }>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
)

export default Root;

// in order to make front end routes
// route from lib that lets us make FE routes