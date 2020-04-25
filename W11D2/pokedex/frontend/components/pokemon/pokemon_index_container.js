import { connect } from "react-redux";
import { requestAllPokemon } from "../../actions/pokemon_actions";
import selectAllPokemon from "../../reducers/selectors";
import PokemonIndex from "./pokemon_index";

const mapStateToProps = state => {
  return {
    pokemon: selectAllPokemon(state)
  }
}

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);




// store = {
//   stateSlice1 (users): {
//     1: {user1},
//     2: {user2}
//   },
//   stateSlice2 (comments) {
//     1: {comment1},
//     2: {comment2}
//   }, 
//   stateSlice3...
// }


// Store >>>> pokemoncontainer >>> pokemonIndex >>> PokemonItem