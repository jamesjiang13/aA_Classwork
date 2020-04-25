import React from "react";
import PokemonIndexItem from "./pokemon_index_item";
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }
  
  render() {

    return(
      <ul>
        <Route path="/pokemon/:id" component={PokemonDetailContainer} />
        {this.props.pokemon.map( (pokemon,idx) => {
          return (
            <PokemonIndexItem key={idx} pokemon={pokemon}/>
          )
        })}
      </ul>
    )
  }
}

export default PokemonIndex;