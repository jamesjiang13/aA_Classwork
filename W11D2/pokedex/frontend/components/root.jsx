import React from "react";
import { Provider } from "react-redux";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from "./pokemon/pokemon_detail_container";
import { HashRouter, Route } from 'react-router-dom';


const Root = ({ store }) => {
  return (
    <Provider store={store}>
        <HashRouter>
          <PokemonIndexContainer /> 
          {/* <PokemonDetailContainer /> */}
          <Route path="/pokemon/:id" component={PokemonDetailContainer} />

        </HashRouter>
    </Provider>
  )
}

export default Root;