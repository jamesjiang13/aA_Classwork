import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON_DETAIL } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon // { ...state, ...action.pokemon }
    case RECEIVE_POKEMON_DETAIL:  
      // const newPoke = {[action.pokemon.id]: action.pokemon} // {1: {name: bulbasaur, type: grass...}}
      const newState = Object.assign({}, state)
      newState[action.payload.pokemon.id] = action.payload.pokemon;
      return newState
    default: 
      return state;
  }  
}

export default pokemonReducer;

// state = { // each external key -> one specific reducer
//   entities: {
//     pokemon: {

//     },
//     otherStuff: {
      
//     }
//   }
// }