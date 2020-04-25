import * as APIUtil from "../util/api_util"

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON_DETAIL = "RECEIVE_POKEMON_DETAIL";

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
})

export const receivePokemonDetail = (payload) => {
  // debugger
  return ({  
    type: RECEIVE_POKEMON_DETAIL,
    payload
  })
}


// this is the thunk action creator 
export const requestAllPokemon = () => (dispatch) => {
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
}

// this is the thunk action creator for receivePokemonDetail

export const requestPokemonDetail = (id) => (dispatch) => {
  APIUtil.fetchPokemonDetail(id)
    .then(poke => dispatch(receivePokemonDetail(poke)))
}