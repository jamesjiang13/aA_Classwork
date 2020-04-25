import React from "react";
import ReactDOM from "react-dom";
import { fetchAllPokemon, fetchPokemonDetail } from './util/api_util';
import { requestAllPokemon, requestPokemonDetail } from './actions/pokemon_actions';
import configureStore from "./store/store";
import selectAllPokemon from "./reducers/selectors";
import Root from "./components/root";
import { HashRouter, Route } from 'react-router-dom';



document.addEventListener("DOMContentLoaded", () => {
  let store = configureStore();
  
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.fetchPokemonDetail = fetchPokemonDetail;
  window.requestPokemonDetail = requestPokemonDetail;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.selectAllPokemon = selectAllPokemon;

  ReactDOM.render(<Root store={store}/>, document.getElementById("root"))
})