const selectAllPokemon = state => {
  return Object.keys(state.entities.pokemon).map( id => state.entities.pokemon[id])
}

export default selectAllPokemon;