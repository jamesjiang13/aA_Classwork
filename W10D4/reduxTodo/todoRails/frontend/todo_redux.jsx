import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from 'store/store'
import { receiveTodos, receiveTodo } from 'actions/todos_actions'
import Root from './components/root'
import selectors from "./reducers/selectors"


document.addEventListener("DOMContentLoaded",()=>{
    const root = document.getElementById("root");
    const store = configureStore();
    
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.selectors = selectors;

    ReactDOM.render(<Root store={store} />, root);
})
